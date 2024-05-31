module Blend2D
  class ImageCodec < Core(LibBlend2D::BLImageCodecCore)
    def initialize(name : ::String)
      LibBlend2D.blImageCodecInitByName(out @core, name.to_unsafe, name.size, nil).success_or_raise
    end

    def finalize
      LibBlend2D.blImageCodecDestroy(self).success_or_raise
    end
  end
end
