module Blend2D::Imaging
  class ImageDecoder
    # :nodoc:
    private def initialize
      LibBlend2D.blImageDecoderInit(out @core).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blImageDecoderDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset
      LibBlend2D.blImageDecoderReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : ImageDecoder)
      LibBlend2D.blImageDecoderAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : ImageDecoder)
      LibBlend2D.blImageDecoderAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def restart
      LibBlend2D.blImageDecoderRestart(self).success_or_raise
    end

    # :nodoc:
    private def read_info(infoOut : LibBlend2D::BLImageInfo*, data : UInt8*, size : Int32)
      LibBlend2D.blImageDecoderReadInfo(self, infoOut, data, size).success_or_raise
    end

    # :nodoc:
    private def read_frame(imageOut : Image, data : UInt8*, size : Int32)
      LibBlend2D.blImageDecoderReadFrame(self, imageOut, data, size).success_or_raise
    end
  end
end
