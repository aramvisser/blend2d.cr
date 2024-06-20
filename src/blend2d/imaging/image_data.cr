module Blend2D::Imaging
  struct ImageData < BLStruct(LibBlend2D::BLImageData)
    delegate :flags, :size, :stride, to: @core

    def initialize(@core)
    end

    def pixel_data : Slice(UInt32)
      Slice.new @core.pixel_data.as(Pointer(UInt32)), size.w * size.h
    end

    def format : Format
      Format.new @core.format
    end
  end
end
