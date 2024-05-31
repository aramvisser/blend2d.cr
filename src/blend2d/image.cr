module Blend2D
  class Image < Core(LibBlend2D::BLImageCore)
    def self.read_from_file(filename) : Image
      image = new
      LibBlend2D.blImageReadFromFile(image, filename.to_s, nil).success_or_raise
      image
    end

    private def initialize
      LibBlend2D.blImageInit(out @core).success_or_raise
    end

    def initialize(w : Int32, h : Int32, format : Format = Format::Prgb32)
      LibBlend2D.blImageInitAs(out @core, w, h, format).success_or_raise
    end

    def finalize
      LibBlend2D.blImageDestroy(self).success_or_raise
    end

    # Codec is determined based on file extension
    def write_to_file(filename) : Bool
      codec_name = ::Path.new(filename).extension.lchop(".").upcase
      codec = ImageCodec.new(codec_name)
      write_to_file(filename, codec)
    end

    def write_to_file(fileName : String|::Path, codec : ImageCodec) : Bool
      LibBlend2D.blImageWriteToFile(self, fileName.to_s, codec).success_or_raise
    end
  end
end
