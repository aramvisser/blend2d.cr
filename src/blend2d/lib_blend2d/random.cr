# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blRandomReset(self : BLRandom*, seed : LibC::ULong) : BLResult
    fun blRandomNextUInt32(self : BLRandom*) : UInt32
    fun blRandomNextUInt64(self : BLRandom*) : LibC::ULong
    fun blRandomNextDouble(self : BLRandom*) : Float64

    struct BLRandom
      data : LibC::ULong[2]
    end
  end
end