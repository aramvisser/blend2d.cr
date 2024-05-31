module Blend2D
  class ImageDecoder
    # :nodoc:
    def initialize
      LibBlend2D.blImageDecoderInit(out @core).success_or_raise
    end

    # :nodoc:
    def finalize
      LibBlend2D.blImageDecoderDestroy(self).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blImageDecoderReset(self).success_or_raise
    end

    # :nodoc:
    def assign_move(other : ImageDecoder) : Bool
      LibBlend2D.blImageDecoderAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : ImageDecoder) : Bool
      LibBlend2D.blImageDecoderAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def restart : Bool
      LibBlend2D.blImageDecoderRestart(self).success_or_raise
    end

    # :nodoc:
    def read_info(infoOut : LibBlend2D::BLImageInfo*, data : UInt8*, size : Int32) : Bool
      LibBlend2D.blImageDecoderReadInfo(self, infoOut, data, size).success_or_raise
    end

    # :nodoc:
    def read_frame(imageOut : Image, data : UInt8*, size : Int32) : Bool
      LibBlend2D.blImageDecoderReadFrame(self, imageOut, data, size).success_or_raise
    end
  end
end
