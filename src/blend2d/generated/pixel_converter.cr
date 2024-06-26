module Blend2D::Imaging
  class PixelConverter
    # :nodoc:
    private def initialize
      LibBlend2D.blPixelConverterInit(out @core).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blPixelConverterDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blPixelConverterReset(self).success_or_raise
    end

    # :nodoc:
    private def assign(other : PixelConverter) : Bool
      LibBlend2D.blPixelConverterAssign(self, other).success_or_raise
    end

    # :nodoc:
    private def create(dstInfo : LibBlend2D::BLFormatInfo*, srcInfo : LibBlend2D::BLFormatInfo*, createFlags : PixelConverterCreateFlags) : Bool
      LibBlend2D.blPixelConverterCreate(self, dstInfo, srcInfo, createFlags).success_or_raise
    end

    # :nodoc:
    private def convert(dstData : Pointer, dstStride : LibC::Long, srcData : Pointer, srcStride : LibC::Long, w : UInt32, h : UInt32, options : LibBlend2D::BLPixelConverterOptions*) : Bool
      LibBlend2D.blPixelConverterConvert(self, dstData, dstStride, srcData, srcStride, w, h, options).success_or_raise
    end
  end
end
