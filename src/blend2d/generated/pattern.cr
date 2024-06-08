module Blend2D
  class Pattern
    # :nodoc:
    private def initialize
      LibBlend2D.blPatternInit(out @core).success_or_raise
    end

    # :nodoc:
    private def initialize(image : Image, area : LibBlend2D::BLRectI*, extendMode : ExtendMode, transform : LibBlend2D::BLMatrix2D*)
      LibBlend2D.blPatternInitAs(out @core, image, area, extendMode, transform).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blPatternReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Pattern) : Bool
      LibBlend2D.blPatternAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Pattern) : Bool
      LibBlend2D.blPatternAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : Pattern) : Bool
      LibBlend2D.blPatternAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def create(image : Image, area : LibBlend2D::BLRectI*, extendMode : ExtendMode, transform : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blPatternCreate(self, image, area, extendMode, transform).success_or_raise
    end

    # :nodoc:
    private def get_image(image : Image) : Bool
      LibBlend2D.blPatternGetImage(self, image).success_or_raise
    end

    # :nodoc:
    private def set_image(image : Image, area : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blPatternSetImage(self, image, area).success_or_raise
    end

    # :nodoc:
    private def reset_image : Bool
      LibBlend2D.blPatternResetImage(self).success_or_raise
    end

    # :nodoc:
    private def get_area(areaOut : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blPatternGetArea(self, areaOut).success_or_raise
    end

    # :nodoc:
    private def area=(area : LibBlend2D::BLRectI*)
      LibBlend2D.blPatternSetArea(self, area).success_or_raise
    end

    # :nodoc:
    private def reset_area : Bool
      LibBlend2D.blPatternResetArea(self).success_or_raise
    end

    # :nodoc:
    private def extend_mode : ExtendMode
      LibBlend2D.blPatternGetExtendMode(self)
    end

    # :nodoc:
    private def extend_mode=(extendMode : ExtendMode)
      LibBlend2D.blPatternSetExtendMode(self, extendMode).success_or_raise
    end

    # :nodoc:
    private def get_transform(transformOut : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blPatternGetTransform(self, transformOut).success_or_raise
    end

    # :nodoc:
    private def transform_type : TransformType
      LibBlend2D.blPatternGetTransformType(self)
    end

    # :nodoc:
    private def apply_transform_op(opType : TransformOp, opData : Pointer) : Bool
      LibBlend2D.blPatternApplyTransformOp(self, opType, opData).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Pattern, b : Pattern) : Int32
      LibBlend2D.blPatternEquals(a, b)
    end
  end
end
