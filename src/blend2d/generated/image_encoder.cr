module Blend2D
  class ImageEncoder
    # :nodoc:
    def initialize
      LibBlend2D.blImageEncoderInit(out @core).success_or_raise
    end

    # :nodoc:
    def finalize
      LibBlend2D.blImageEncoderDestroy(self).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blImageEncoderReset(self).success_or_raise
    end

    # :nodoc:
    def assign_move(other : ImageEncoder) : Bool
      LibBlend2D.blImageEncoderAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : ImageEncoder) : Bool
      LibBlend2D.blImageEncoderAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def restart : Bool
      LibBlend2D.blImageEncoderRestart(self).success_or_raise
    end

    # :nodoc:
    def write_frame(dst : Array, image : Image) : Bool
      LibBlend2D.blImageEncoderWriteFrame(self, dst, image).success_or_raise
    end
  end
end
