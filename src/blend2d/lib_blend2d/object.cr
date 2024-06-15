# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    alias BLDestroyExternalDataFunc = (Void*, Void*, Void*) -> Void*

    fun blObjectAllocImpl(self : BLObjectCore*, object_info : UInt32, impl_size : Int32) : BLResult
    fun blObjectAllocImplAligned(self : BLObjectCore*, object_info : UInt32, impl_size : Int32, impl_alignment : Int32) : BLResult
    fun blObjectAllocImplExternal(self : BLObjectCore*, object_info : UInt32, impl_size : Int32, immutable : Int32, destroy_func : BLDestroyExternalDataFunc, user_data : Void*) : BLResult
    fun blObjectFreeImpl(impl : BLObjectImpl*) : BLResult
    fun blObjectInitMove(self : BLUnknown*, other : BLUnknown*) : BLResult
    fun blObjectInitWeak(self : BLUnknown*, other : BLUnknown*) : BLResult
    fun blObjectReset(self : BLUnknown*) : BLResult
    fun blObjectAssignMove(self : BLUnknown*, other : BLUnknown*) : BLResult
    fun blObjectAssignWeak(self : BLUnknown*, other : BLUnknown*) : BLResult
    fun blObjectGetProperty(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : BLVarCore*) : BLResult
    fun blObjectGetPropertyBool(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : Int32*) : BLResult
    fun blObjectGetPropertyInt32(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : Int32*) : BLResult
    fun blObjectGetPropertyInt64(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : LibC::Long*) : BLResult
    fun blObjectGetPropertyUInt32(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : UInt32*) : BLResult
    fun blObjectGetPropertyUInt64(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : LibC::ULong*) : BLResult
    fun blObjectGetPropertyDouble(self : BLUnknown*, name : UInt8*, name_size : Int32, value_out : Float64*) : BLResult
    fun blObjectSetProperty(self : BLUnknown*, name : UInt8*, name_size : Int32, value : BLUnknown*) : BLResult
    fun blObjectSetPropertyBool(self : BLUnknown*, name : UInt8*, name_size : Int32, value : Int32) : BLResult
    fun blObjectSetPropertyInt32(self : BLUnknown*, name : UInt8*, name_size : Int32, value : Int32) : BLResult
    fun blObjectSetPropertyInt64(self : BLUnknown*, name : UInt8*, name_size : Int32, value : LibC::Long) : BLResult
    fun blObjectSetPropertyUInt32(self : BLUnknown*, name : UInt8*, name_size : Int32, value : UInt32) : BLResult
    fun blObjectSetPropertyUInt64(self : BLUnknown*, name : UInt8*, name_size : Int32, value : LibC::ULong) : BLResult
    fun blObjectSetPropertyDouble(self : BLUnknown*, name : UInt8*, name_size : Int32, value : Float64) : BLResult

    enum BLObjectInfoShift : UInt32
      PShift    =  0
      QShift    =  8
      CShift    =  8
      BShift    = 12
      AShift    = 16
      TypeShift = 22
      RShift    = 29
      DShift    = 30
      MShift    = 31
    end

    enum BLObjectInfoBits : UInt32
      PMask      =        255
      QMask      =      65280
      CMask      =       3840
      Mask       =      61440
      AMask      =    4128768
      FieldsMask =    4194303
      TypeMask   =  532676608
      RFlag      =  536870912
      DFlag      = 1073741824
      MFlag      = 2147483648
      MdFlags    = 3221225472
      MdrFlags   = 3758096384
    end

    enum BLObjectType : UInt32
      RGBA                  =   0
      Rgba32                =   1
      Rgba64                =   2
      Null                  =   3
      Pattern               =   4
      Gradient              =   5
      Image                 =   9
      Path                  =  10
      Font                  =  16
      FontFeatureSettings   =  17
      FontVariationSettings =  18
      BitArray              =  25
      BitSet                =  26
      Bool                  =  28
      Int64                 =  29
      UInt64                =  30
      Double                =  31
      String                =  32
      ArrayObject           =  33
      ArrayInt8             =  34
      ArrayUInt8            =  35
      ArrayInt16            =  36
      ArrayUInt16           =  37
      ArrayInt32            =  38
      ArrayUInt32           =  39
      ArrayInt64            =  40
      ArrayUInt64           =  41
      ArrayFloat32          =  42
      ArrayFloat64          =  43
      ArrayStruct1          =  44
      ArrayStruct2          =  45
      ArrayStruct3          =  46
      ArrayStruct4          =  47
      ArrayStruct6          =  48
      ArrayStruct8          =  49
      ArrayStruct10         =  50
      ArrayStruct12         =  51
      ArrayStruct16         =  52
      ArrayStruct20         =  53
      ArrayStruct24         =  54
      ArrayStruct32         =  55
      Context               = 100
      ImageCodec            = 101
      ImageDecoder          = 102
      ImageEncoder          = 103
      FontFace              = 104
      FontData              = 105
      FontManager           = 106
      MinArray              =  33
      MaxArray              =  55
      MinStyle              =   0
      MaxStyle              =   5
      MinVirtual            = 100
      MaxVirtual            = 127
    end

    struct BLObjectInfo
      bits : UInt32
    end

    union BLObjectDetail
      u32_data_overlap : UInt32[2]
      impl_payload : UInt32
      info : BLObjectInfo
    end

    struct BLObjectVirtBase
      destroy : (BLObjectImpl*) -> BLResult*
      get_property : (BLObjectImpl*, UInt8*, Int32, BLVarCore*) -> BLResult*
      set_property : (BLObjectImpl*, UInt8*, Int32, BLVarCore*) -> BLResult*
    end

    struct BLObjectVirt
      base : BLObjectVirtBase
    end

    struct BLObjectCore
      _d : BLObjectImpl*
    end

    struct BLObjectImpl
      _dummy : Void*
    end
  end
end
