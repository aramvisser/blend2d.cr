module Blend2D::Imaging
  class ImageEncoder
    # :nodoc:
    private def initialize
      LibBlend2D.blImageEncoderInit(out @core).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blImageEncoderDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset
      LibBlend2D.blImageEncoderReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : ImageEncoder)
      LibBlend2D.blImageEncoderAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : ImageEncoder)
      LibBlend2D.blImageEncoderAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def restart
      LibBlend2D.blImageEncoderRestart(self).success_or_raise
    end

    # :nodoc:
    private def write_frame(dst : Array, image : Image)
      LibBlend2D.blImageEncoderWriteFrame(self, dst, image).success_or_raise
    end
  end
end
