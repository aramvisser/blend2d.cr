# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blImageEncoderInit(self : BLImageEncoderCore*) : BLResult
    fun blImageEncoderInitMove(self : BLImageEncoderCore*, other : BLImageEncoderCore*) : BLResult
    fun blImageEncoderInitWeak(self : BLImageEncoderCore*, other : BLImageEncoderCore*) : BLResult
    fun blImageEncoderDestroy(self : BLImageEncoderCore*) : BLResult
    fun blImageEncoderReset(self : BLImageEncoderCore*) : BLResult
    fun blImageEncoderAssignMove(self : BLImageEncoderCore*, other : BLImageEncoderCore*) : BLResult
    fun blImageEncoderAssignWeak(self : BLImageEncoderCore*, other : BLImageEncoderCore*) : BLResult
    fun blImageEncoderRestart(self : BLImageEncoderCore*) : BLResult
    fun blImageEncoderWriteFrame(self : BLImageEncoderCore*, dst : BLArrayCore*, image : BLImageCore*) : BLResult

    struct BLImageEncoderVirt
      base : BLObjectVirtBase
      restart : (BLImageEncoderImpl*) -> BLResult*
      write_frame : (BLImageEncoderImpl*, BLArrayCore*, BLImageCore*) -> BLResult*
    end

    struct BLImageEncoderImpl
      virt : BLImageEncoderVirt*
      codec : BLImageCodecCore
      last_result : BLResult
      handle : Void*
      frame_index : LibC::ULong
      buffer_index : LibC::ULong
    end

    struct BLImageEncoderCore
      _d : BLImageEncoderImpl*
    end
  end
end
