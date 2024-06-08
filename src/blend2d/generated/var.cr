module Blend2D
  class Var
    # :nodoc:
    private def initialize(self_ : Pointer, type : ObjectType)
      LibBlend2D.blVarInitType(out @core, type).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer)
      LibBlend2D.blVarInitNull(out @core).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, value : Int32)
      LibBlend2D.blVarInitBool(out @core, value).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, value : Int32)
      LibBlend2D.blVarInitInt32(out @core, value).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, value : LibC::Long)
      LibBlend2D.blVarInitInt64(out @core, value).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, value : UInt32)
      LibBlend2D.blVarInitUInt32(out @core, value).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, value : LibC::ULong)
      LibBlend2D.blVarInitUInt64(out @core, value).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, value : Float64)
      LibBlend2D.blVarInitDouble(out @core, value).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, rgba : LibBlend2D::BLRgba*)
      LibBlend2D.blVarInitRgba(out @core, rgba).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, rgba32 : UInt32)
      LibBlend2D.blVarInitRgba32(out @core, rgba32).success_or_raise
    end

    # :nodoc:
    private def initialize(self_ : Pointer, rgba64 : LibC::ULong)
      LibBlend2D.blVarInitRgba64(out @core, rgba64).success_or_raise
    end

    # :nodoc:
    private def self.destroy(self_ : Pointer) : Bool
      LibBlend2D.blVarDestroy(self_).success_or_raise
    end

    # :nodoc:
    private def self.reset(self_ : Pointer) : Bool
      LibBlend2D.blVarReset(self_).success_or_raise
    end

    # :nodoc:
    private def self.assign_null(self_ : Pointer) : Bool
      LibBlend2D.blVarAssignNull(self_).success_or_raise
    end

    # :nodoc:
    private def self.assign_bool(self_ : Pointer, value : Int32) : Bool
      LibBlend2D.blVarAssignBool(self_, value).success_or_raise
    end

    # :nodoc:
    private def self.assign_int32(self_ : Pointer, value : Int32) : Bool
      LibBlend2D.blVarAssignInt32(self_, value).success_or_raise
    end

    # :nodoc:
    private def self.assign_int64(self_ : Pointer, value : LibC::Long) : Bool
      LibBlend2D.blVarAssignInt64(self_, value).success_or_raise
    end

    # :nodoc:
    private def self.assign_u_int32(self_ : Pointer, value : UInt32) : Bool
      LibBlend2D.blVarAssignUInt32(self_, value).success_or_raise
    end

    # :nodoc:
    private def self.assign_u_int64(self_ : Pointer, value : LibC::ULong) : Bool
      LibBlend2D.blVarAssignUInt64(self_, value).success_or_raise
    end

    # :nodoc:
    private def self.assign_double(self_ : Pointer, value : Float64) : Bool
      LibBlend2D.blVarAssignDouble(self_, value).success_or_raise
    end

    # :nodoc:
    private def self.assign_rgba(self_ : Pointer, rgba : LibBlend2D::BLRgba*) : Bool
      LibBlend2D.blVarAssignRgba(self_, rgba).success_or_raise
    end

    # :nodoc:
    private def self.assign_rgba32(self_ : Pointer, rgba32 : UInt32) : Bool
      LibBlend2D.blVarAssignRgba32(self_, rgba32).success_or_raise
    end

    # :nodoc:
    private def self.assign_rgba64(self_ : Pointer, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blVarAssignRgba64(self_, rgba64).success_or_raise
    end

    # :nodoc:
    private def self.assign_move(self_ : Pointer, other : Pointer) : Bool
      LibBlend2D.blVarAssignMove(self_, other).success_or_raise
    end

    # :nodoc:
    private def self.assign_weak(self_ : Pointer, other : Pointer) : Bool
      LibBlend2D.blVarAssignWeak(self_, other).success_or_raise
    end

    # :nodoc:
    private def self.get_type(self_ : Pointer) : ObjectType
      LibBlend2D.blVarGetType(self_)
    end

    # :nodoc:
    private def self.to_bool(self_ : Pointer, out_ : Int32*) : Bool
      LibBlend2D.blVarToBool(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_int32(self_ : Pointer, out_ : Int32*) : Bool
      LibBlend2D.blVarToInt32(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_int64(self_ : Pointer, out_ : LibC::Long*) : Bool
      LibBlend2D.blVarToInt64(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_u_int32(self_ : Pointer, out_ : UInt32*) : Bool
      LibBlend2D.blVarToUInt32(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_u_int64(self_ : Pointer, out_ : LibC::ULong*) : Bool
      LibBlend2D.blVarToUInt64(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_double(self_ : Pointer, out_ : Float64*) : Bool
      LibBlend2D.blVarToDouble(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_rgba(self_ : Pointer, out_ : LibBlend2D::BLRgba*) : Bool
      LibBlend2D.blVarToRgba(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_rgba32(self_ : Pointer, out_ : UInt32*) : Bool
      LibBlend2D.blVarToRgba32(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.to_rgba64(self_ : Pointer, out_ : LibC::ULong*) : Bool
      LibBlend2D.blVarToRgba64(self_, out_).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Pointer, b : Pointer) : Int32
      LibBlend2D.blVarEquals(a, b)
    end

    # :nodoc:
    private def self.equals_null(self_ : Pointer) : Int32
      LibBlend2D.blVarEqualsNull(self_)
    end

    # :nodoc:
    private def self.equals_bool(self_ : Pointer, value : Int32) : Int32
      LibBlend2D.blVarEqualsBool(self_, value)
    end

    # :nodoc:
    private def self.equals_int64(self_ : Pointer, value : LibC::Long) : Int32
      LibBlend2D.blVarEqualsInt64(self_, value)
    end

    # :nodoc:
    private def self.equals_u_int64(self_ : Pointer, value : LibC::ULong) : Int32
      LibBlend2D.blVarEqualsUInt64(self_, value)
    end

    # :nodoc:
    private def self.equals_double(self_ : Pointer, value : Float64) : Int32
      LibBlend2D.blVarEqualsDouble(self_, value)
    end

    # :nodoc:
    private def self.equals_rgba(self_ : Pointer, rgba : LibBlend2D::BLRgba*) : Int32
      LibBlend2D.blVarEqualsRgba(self_, rgba)
    end

    # :nodoc:
    private def self.equals_rgba32(self_ : Pointer, rgba32 : UInt32) : Int32
      LibBlend2D.blVarEqualsRgba32(self_, rgba32)
    end

    # :nodoc:
    private def self.equals_rgba64(self_ : Pointer, rgba64 : LibC::ULong) : Int32
      LibBlend2D.blVarEqualsRgba64(self_, rgba64)
    end

    # :nodoc:
    private def self.strict_equals(a : Pointer, b : Pointer) : Int32
      LibBlend2D.blVarStrictEquals(a, b)
    end
  end
end
