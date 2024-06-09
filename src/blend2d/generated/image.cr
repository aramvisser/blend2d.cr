module Blend2D
  class Image
    # :nodoc:
    private def initialize(w : Int32, h : Int32, format : Format, pixelData : Pointer, stride : LibC::Long, accessFlags : DataAccessFlags, destroyFunc : LibBlend2D::BLDestroyExternalDataFunc, userData : Pointer)
      LibBlend2D.blImageInitAsFromData(out @core, w, h, format, pixelData, stride, accessFlags, destroyFunc, userData).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blImageReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Image) : Bool
      LibBlend2D.blImageAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Image) : Bool
      LibBlend2D.blImageAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : Image) : Bool
      LibBlend2D.blImageAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def create(w : Int32, h : Int32, format : Format) : Bool
      LibBlend2D.blImageCreate(self, w, h, format).success_or_raise
    end

    # :nodoc:
    private def create_from_data(w : Int32, h : Int32, format : Format, pixelData : Pointer, stride : LibC::Long, accessFlags : DataAccessFlags, destroyFunc : LibBlend2D::BLDestroyExternalDataFunc, userData : Pointer) : Bool
      LibBlend2D.blImageCreateFromData(self, w, h, format, pixelData, stride, accessFlags, destroyFunc, userData).success_or_raise
    end

    # :nodoc:
    private def get_data(dataOut : LibBlend2D::BLImageData*) : Bool
      LibBlend2D.blImageGetData(self, dataOut).success_or_raise
    end

    # :nodoc:
    private def make_mutable(dataOut : LibBlend2D::BLImageData*) : Bool
      LibBlend2D.blImageMakeMutable(self, dataOut).success_or_raise
    end

    # :nodoc:
    private def convert(format : Format) : Bool
      LibBlend2D.blImageConvert(self, format).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Image, b : Image) : Int32
      LibBlend2D.blImageEquals(a, b)
    end

    # :nodoc:
    private def self.scale(dst : Image, src : Image, size : LibBlend2D::BLSizeI*, filter : ImageScaleFilter) : Bool
      LibBlend2D.blImageScale(dst, src, size, filter).success_or_raise
    end

    # :nodoc:
    private def read_from_data(data : Pointer, size : Int32, codecs : Array) : Bool
      LibBlend2D.blImageReadFromData(self, data, size, codecs).success_or_raise
    end

    # :nodoc:
    private def write_to_data(dst : Array, codec : ImageCodec) : Bool
      LibBlend2D.blImageWriteToData(self, dst, codec).success_or_raise
    end
  end
end
