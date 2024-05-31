module Blend2D
  class Pattern < Core(LibBlend2D::BLPatternCore)
    def initialize(image : Image)
      LibBlend2D.blPatternInitAs(
        out @core,
        image,
        Pointer(Blend2D::LibBlend2D::BLRectI).null,
        Blend2D::ExtendMode::Pad,
        Pointer(Blend2D::LibBlend2D::BLMatrix2D).null,
      ).success_or_raise
    end

    def finalize
      LibBlend2D.blPatternDestroy(self).success_or_raise
    end

  end
end
