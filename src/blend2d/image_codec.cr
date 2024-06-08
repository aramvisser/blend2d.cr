module Blend2D
  class ImageCodec < Core(LibBlend2D::BLImageCodecCore)
    def initialize(@core : T)
    end

    def self.find_by_extension(extension : String)
    end

    def initialize(name : ::String)
      LibBlend2D.blImageCodecInitByName(out @core, name.to_unsafe, name.size, nil).success_or_raise
    end

    def finalize
      LibBlend2D.blImageCodecDestroy(self).success_or_raise
    end

    def self.built_in_codecs : Array(ImageCodec)
      bl_array = BLArray(LibBlend2D::BLImageCodecCore).new
      LibBlend2D.blImageCodecArrayInitBuiltInCodecs(bl_array).success_or_raise
      bl_array.to_a(ImageCodec)
    end

    def name
      BLString.new @core._d.value.name
    end

    def vendor
      BLString.new @core._d.value.vendor
    end

    def mime_type
      BLString.new @core._d.value.mime_type
    end

    def extensions
      BLString.new @core._d.value.extensions
    end
  end
end
