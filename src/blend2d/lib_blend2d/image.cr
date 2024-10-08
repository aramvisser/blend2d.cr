# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blImageInit(self : BLImageCore*) : BLResult
    fun blImageInitMove(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun blImageInitWeak(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun blImageInitAs(self : BLImageCore*, w : Int32, h : Int32, format : BLFormat) : BLResult
    fun blImageInitAsFromData(self : BLImageCore*, w : Int32, h : Int32, format : BLFormat, pixel_data : Void*, stride : LibC::Long, access_flags : BLDataAccessFlags, destroy_func : BLDestroyExternalDataFunc, user_data : Void*) : BLResult
    fun blImageDestroy(self : BLImageCore*) : BLResult
    fun blImageReset(self : BLImageCore*) : BLResult
    fun blImageAssignMove(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun blImageAssignWeak(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun blImageAssignDeep(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun blImageCreate(self : BLImageCore*, w : Int32, h : Int32, format : BLFormat) : BLResult
    fun blImageCreateFromData(self : BLImageCore*, w : Int32, h : Int32, format : BLFormat, pixel_data : Void*, stride : LibC::Long, access_flags : BLDataAccessFlags, destroy_func : BLDestroyExternalDataFunc, user_data : Void*) : BLResult
    fun blImageGetData(self : BLImageCore*, data_out : BLImageData*) : BLResult
    fun blImageMakeMutable(self : BLImageCore*, data_out : BLImageData*) : BLResult
    fun blImageConvert(self : BLImageCore*, format : BLFormat) : BLResult
    fun blImageEquals(a : BLImageCore*, b : BLImageCore*) : Bool
    fun blImageScale(dst : BLImageCore*, src : BLImageCore*, size : BLSizeI*, filter : BLImageScaleFilter) : BLResult
    fun blImageReadFromFile(self : BLImageCore*, file_name : UInt8*, codecs : BLArrayCore*) : BLResult
    fun blImageReadFromData(self : BLImageCore*, data : Void*, size : LibC::ULong, codecs : BLArrayCore*) : BLResult
    fun blImageWriteToFile(self : BLImageCore*, file_name : UInt8*, codec : BLImageCodecCore*) : BLResult
    fun blImageWriteToData(self : BLImageCore*, dst : BLArrayCore*, codec : BLImageCodecCore*) : BLResult

    enum BLImageInfoFlags : UInt32
      NoFlags     = 0
      Progressive = 1
    end

    enum BLImageScaleFilter : UInt32
      None     = 0
      Nearest  = 1
      Bilinear = 2
      Bicubic  = 3
      Lanczos  = 4
    end

    struct BLImageData
      pixel_data : Void*
      stride : LibC::Long
      size : BLSizeI
      format : UInt32
      flags : UInt32
    end

    struct BLImageInfo
      size : BLSizeI
      density : BLSize
      flags : UInt32
      depth : UInt16
      plane_count : UInt16
      frame_count : LibC::ULong
      format : UInt8[16]
      compression : UInt8[16]
    end

    struct BLImageCore
      _d : BLImageImpl*
    end

    struct BLImageImpl
      pixel_data : Void*
      stride : LibC::Long
      size : BLSizeI
      format : UInt8
      flags : UInt8
      depth : UInt16
      reserved : UInt8[4]
    end
  end
end
