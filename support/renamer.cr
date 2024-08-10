require "clang"

module Renamer
  def self.type(type : Clang::Type | String) : String
    return type if type.is_a?(String)

    case type.kind
    when .int?              then "Int32"
    when .u_int?            then "UInt32"
    when .u_short?          then "UInt16"
    when .s_char?, .char_s? then "UInt8"
    when .u_char?, .char_u? then "UInt8"
    when .long?             then "LibC::Long"
    when .u_long?           then "LibC::ULong"
    when .float?            then "Float32"
    when .double?           then "Float64"
    when .pointer?          then pointer(type)
    when .record?
      spelling = type.cursor.spelling
      spelling = type.spelling if type.cursor.spelling.empty?
      spelling = "Void" if spelling == "__va_list_tag"
      spelling
    when .elaborated?     then type(type.named_type)
    when .typedef?        then typedef(type)
    when .constant_array? then constant_array(type)
    when .function_proto? then function_proto(type)
    else                       type.kind.to_s
    end
  end

  def self.pointer(type)
    pointee = type(type.pointee_type)
    "#{pointee}*"
  end

  def self.typedef(type)
    if type.spelling.starts_with?("BL")
      type.spelling
    else
      type type.canonical_type
    end
  end

  def self.constant_array(type)
    element = type(type.array_element_type)
    "#{element}[#{type.array_size}]"
  end

  def self.function_proto(type)
    String.build do |str|
      str << '('
      type.arguments.each_with_index do |t, index|
        str << ", " unless index == 0
        str << type(t)
      end
      str << ") -> "
      str << type(type.result_type)
    end
  end

  def self.variable_name(name)
    case name
    when "end" then "_end"
    else            name
    end.underscore
  end

  def self.enum_value(enum_name, value_name)
    enum_name = enum_name.underscore.upcase
    value_name = value_name[common_prefix_length(enum_name, value_name)..].lchop("_")

    ignore_enums = %w[BE LE RW UTF8 UTF16 UTF32]
    ignore_suffixes = %w[RGB RGBA]

    return value_name if ignore_enums.includes?(value_name) ||
                         ignore_suffixes.any? { |s| value_name.ends_with?(s) }

    value_name.downcase.camelcase
  end

  def self.common_prefix_length(str1 : String, str2 : String) : Int32
    length = 0
    min_length = [str1.size, str2.size].min

    min_length.times do |i|
      if str1[i] == str2[i]
        length += 1
      else
        break
      end
    end

    length
  end
end
