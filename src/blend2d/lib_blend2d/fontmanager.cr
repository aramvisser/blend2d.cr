# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blFontManagerInit(self : BLFontManagerCore*) : BLResult
    fun blFontManagerInitMove(self : BLFontManagerCore*, other : BLFontManagerCore*) : BLResult
    fun blFontManagerInitWeak(self : BLFontManagerCore*, other : BLFontManagerCore*) : BLResult
    fun blFontManagerInitNew(self : BLFontManagerCore*) : BLResult
    fun blFontManagerDestroy(self : BLFontManagerCore*) : BLResult
    fun blFontManagerReset(self : BLFontManagerCore*) : BLResult
    fun blFontManagerAssignMove(self : BLFontManagerCore*, other : BLFontManagerCore*) : BLResult
    fun blFontManagerAssignWeak(self : BLFontManagerCore*, other : BLFontManagerCore*) : BLResult
    fun blFontManagerCreate(self : BLFontManagerCore*) : BLResult
    fun blFontManagerGetFaceCount(self : BLFontManagerCore*) : Int32
    fun blFontManagerGetFamilyCount(self : BLFontManagerCore*) : Int32
    fun blFontManagerHasFace(self : BLFontManagerCore*, face : BLFontFaceCore*) : Int32
    fun blFontManagerAddFace(self : BLFontManagerCore*, face : BLFontFaceCore*) : BLResult
    fun blFontManagerQueryFace(self : BLFontManagerCore*, name : UInt8*, name_size : Int32, properties : BLFontQueryProperties*, out : BLFontFaceCore*) : BLResult
    fun blFontManagerQueryFacesByFamilyName(self : BLFontManagerCore*, name : UInt8*, name_size : Int32, out : BLArrayCore*) : BLResult
    fun blFontManagerEquals(a : BLFontManagerCore*, b : BLFontManagerCore*) : Int32

    struct BLFontQueryProperties
      style : UInt32
      weight : UInt32
      stretch : UInt32
    end

    struct BLFontManagerCore
      _d : BLFontManagerImpl*
    end

    struct BLFontManagerVirt
      base : BLObjectVirtBase
    end

    struct BLFontManagerImpl
      virt : BLFontManagerVirt*
    end
  end
end
