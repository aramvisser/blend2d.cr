require "clang"
require "./renamer"

record BLFile, functions = Array(String).new,
  enums = Array(String).new,
  structs = Array(String).new,
  typedefs = Array(String).new

class Parser
  getter files = Hash(String, BLFile).new

  def visit(root)
    root.visit_children do |cursor|
      case cursor.kind
      when .function_decl?
        if blend2d_location?(cursor)
          store_function cursor, visit_function(cursor)
        end
      when .enum_decl?
        if blend2d_location?(cursor) && cursor.first_child?
          store_enum cursor, visit_enum(cursor)
        end
      when .struct_decl?
        if blend2d_location?(cursor) && cursor.first_child?
          store_struct cursor, visit_struct(cursor)
        end
      when .union_decl?
        if blend2d_location?(cursor) && cursor.first_child?
          store_struct cursor, visit_union(cursor) # Unions can be stored in struct array
        end
      when .typedef_decl?
        if blend2d_location?(cursor)
          store_typedef cursor, visit_typedef(cursor)
        end
      end

      Clang::ChildVisitResult::Continue
    end
  end

  def visit_function(cursor)
    String.build do |str|
      str << "fun " << cursor.spelling << "("

      cursor.arguments.each_with_index do |c, index|
        str << ", " unless index.zero?
        str << Renamer.variable_name(c.spelling) << " : " << Renamer.type(c.type)
      end

      str << ") : " << Renamer.type(cursor.result_type)
    end
  end

  def visit_enum(cursor)
    String.build do |str|
      type = cursor.enum_decl_integer_type.canonical_type

      str << "enum " << cursor.spelling << " : " << Renamer.type(type) << "\n"

      cursor.visit_children do |c|
        next Clang::ChildVisitResult::Continue if c.spelling.ends_with?("_FORCE_UINT") || c.spelling.ends_with?("_MAX_VALUE")

        value = case type.kind
                when .u_int? then c.enum_constant_decl_unsigned_value
                else              c.enum_constant_decl_value
                end

        str << "  " << Renamer.enum_value(cursor.spelling, c.spelling) << " = " << value << "\n"

        Clang::ChildVisitResult::Continue
      end

      # Helper method for Results
      if cursor.spelling == "BLResultCode"
        str << <<-DEF
          def success_or_raise
            return true if self == Success
            raise self.to_s
          end

        DEF
      end

      str << "end"
    end
  end

  def visit_struct(cursor, spelling = cursor.spelling)
    return if spelling.includes?("unnamed")

    String.build do |str|
      str << "struct " << spelling << "\n"

      members = visit_struct_members(cursor)

      cores_without_impls = ["BLVarCore"]

      # Special case for BLObjectDetail, point directly to Impl version
      if members.size == 1 &&
         members[0][0] == "_d" &&
         !cores_without_impls.includes?(spelling)
        str << " _d : " << spelling.rchop("Core") << "Impl*\n"
      else
        members.each do |(name, type)|
          str << "  " << Renamer.variable_name(name) << " : " << Renamer.type(type) << "\n"
        end
      end

      str << "end"
    end
  end

  def visit_union(cursor, spelling = cursor.spelling)
    String.build do |str|
      str << "union " << spelling << "\n"

      visit_union_members(cursor).each do |(name, type)|
        str << "  " << name << " : " << Renamer.type(type) << "\n"
      end

      str << "end"
    end
  end

  def visit_struct_members(cursor) : Array(Tuple(String, Clang::Type))
    members = [] of Tuple(String, Clang::Type)

    cursor.visit_children do |c|
      case c.kind
      when .field_decl?
        members << {c.spelling, c.type}
      when .union_decl?
        members += visit_union_members(c)
      else
        STDERR.puts "WARNING: unexpected #{c.kind} within #{cursor.kind} (visit_struct_members)"
      end

      Clang::ChildVisitResult::Continue
    end

    members
  end

  def visit_union_members(cursor) : Array(Tuple(String, Clang::Type))
    members = [] of Array(Tuple(String, Clang::Type))

    cursor.visit_children do |c|
      case c.kind
      when .field_decl?
        if c.first_child?.not_nil!.kind.struct_decl? # Merge nested structs
          members << visit_struct_members c.first_child?.not_nil!
        else
          members << [{c.spelling, c.type}]
        end
      when .struct_decl?
        members << visit_struct_members(c)
      else
        STDERR.puts "WARNING: unexpected #{c.kind} within #{cursor.kind} (visit_union)"
      end

      Clang::ChildVisitResult::Continue
    end

    return members.sort_by do |vars|
      vars.sum &.last.size_of
    end.last
  end

  def visit_typedef(cursor)
    name = cursor.spelling
    type = cursor.typedef_decl_underlying_type

    # Special case for BLResult, otherwise it would just be an uint32_t
    if name == "BLResult"
      return "alias BLResult = BLResultCode"
    end

    return if type.spelling.ends_with?(name) # Typedef to struct with same name can be ignored

    if !type.kind.elaborated?
      return "alias #{cursor.spelling} = #{Renamer.type type}"
    end

    type = type.named_type

    if type.kind.typedef?
      return "alias #{cursor.spelling} = #{Renamer.type type}"
    end

    if type.kind.record?
      store_struct cursor, visit_struct(type.cursor, name)
      return
    end

    STDERR.puts "WARNING: unexpected #{type.kind} within #{cursor.kind} (visit_typedef)"
  end

  def store_function(cursor, contents)
    filename = Path.new(cursor.location.file_name.not_nil!).basename
    @files[filename] ||= BLFile.new
    @files[filename].functions << contents
  end

  def store_enum(cursor, contents)
    filename = Path.new(cursor.location.file_name.not_nil!).basename
    @files[filename] ||= BLFile.new
    @files[filename].enums << contents
  end

  def store_struct(cursor, contents)
    return unless contents

    filename = Path.new(cursor.location.file_name.not_nil!).basename
    @files[filename] ||= BLFile.new
    @files[filename].structs << contents
  end

  def store_typedef(cursor, contents)
    return unless contents

    filename = Path.new(cursor.location.file_name.not_nil!).basename
    @files[filename] ||= BLFile.new
    @files[filename].typedefs << contents
  end

  def blend2d_location?(cursor)
    cursor.location.file_name.try &.includes?("blend2d")
  end
end
