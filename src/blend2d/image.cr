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

    def initialize(@core : LibBlend2D::BLImageCore)
    end

    def initialize(w : Int32, h : Int32, format : Format = Format::Prgb32)
      LibBlend2D.blImageInitAs(out @core, w, h, format).success_or_raise
    end

    def finalize
      LibBlend2D.blImageDestroy(self).success_or_raise
    end

    # Codec is determined based on file extension
    def write_to_file(filename) : Bool
      codec = ImageCodec.find_by_extension(filename)
      write_to_file(filename, codec)
    end

    def write_to_file(fileName, codec : ImageCodec) : Bool
      LibBlend2D.blImageWriteToFile(self, fileName.to_s, codec).success_or_raise
    end

    def write_to_data(codec : ImageCodec) : BLArray(UInt8)
      dst = BLArray(UInt8).new
      LibBlend2D.blImageWriteToData(self, dst, codec).success_or_raise
      dst
    end

    def write_to_io(io : IO, codec : ImageCodec) : IO
      io.write write_to_data(codec).to_slice
      io
    end

    def size : SizeI
      SizeI.new @core._d.value.size
    end

    def data : ImageData
      LibBlend2D.blImageGetData(self, out image_data).success_or_raise
      ImageData.new image_data
    end
  end
end
