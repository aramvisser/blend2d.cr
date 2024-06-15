module Blend2D
  alias VarTypes = Bool | RGBA | RGBA32 | RGBA64 | Int64 | UInt64 | Float64

  class Var(T) < Core(LibBlend2D::BLVarCore)
    def self.init_with_type(var : LibBlend2D::BLVarCore)
      object_type = LibBlend2D.blVarGetType(pointerof(var))

      case object_type
      when LibBlend2D::BLObjectType::Bool
        return Var(Bool).new var
      when LibBlend2D::BLObjectType::Int64
        return Var(Int64).new var
      when LibBlend2D::BLObjectType::UInt64
        return Var(UInt64).new var
      when LibBlend2D::BLObjectType::Double
        return Var(Float64).new var
      when LibBlend2D::BLObjectType::RGBA
        return Var(RGBA).new var
      when LibBlend2D::BLObjectType::Rgba32
        return Var(RGBA32).new var
      when LibBlend2D::BLObjectType::Rgba64
        return Var(RGBA64).new var
      else
        raise "Unkown object type: #{object_type} (Var.init_with_type)"
      end
    end

    protected def initialize(@core : LibBlend2D::BLVarCore)
    end

    def finalize
      LibBlend2D.blVarDestroy(self).success_or_raise
    end

    def value : VarTypes
      if T == Bool
        LibBlend2D.blVarToBool(self, out bool)
        bool != 0
      elsif T == Int64
        LibBlend2D.blVarToInt64(self, out int64)
        int64
      elsif T == UInt64
        LibBlend2D.blVarToUInt64(self, out uint64)
        uint64
      elsif T == Float64
        LibBlend2D.blVarToDouble(self, out double)
        double
      elsif T == RGBA
        LibBlend2D.blVarToRgba(self, out rgba)
        RGBA.new rgba
      elsif T == RGBA32
        LibBlend2D.blVarToRgba32(self, out rgba32)
        RGBA32.new rgba32
      elsif T == RGBA64
        LibBlend2D.blVarToRgba32(self, out rgba64)
        RGBA64.new rgba64
      else
        raise "Can't convert #{T} to value (Var#value)"
      end
    end
  end
end
