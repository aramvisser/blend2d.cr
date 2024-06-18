module Blend2D
  class BLArray(T) < Core(LibBlend2D::BLArrayCore)
    def self.object_type : ObjectType
      case
      when T == Int8    then ObjectType::ArrayInt8
      when T == UInt8   then ObjectType::ArrayUInt8
      when T == Int16   then ObjectType::ArrayInt16
      when T == UInt16  then ObjectType::ArrayUInt16
      when T == Int32   then ObjectType::ArrayInt32
      when T == UInt32  then ObjectType::ArrayUInt32
      when T == Int64   then ObjectType::ArrayInt64
      when T == UInt64  then ObjectType::ArrayUInt64
      when T == Float32 then ObjectType::ArrayFloat32
      when T == Float64 then ObjectType::ArrayFloat64
      else                   ObjectType::ArrayObject
      end
    end

    def initialize
      LibBlend2D.blArrayInit(out @core, self.class.object_type).success_or_raise
    end

    def finalize
      LibBlend2D.blArrayDestroy(self).success_or_raise
    end

    def size : Int32
      LibBlend2D.blArrayGetSize(self)
    end

    def capacity : Int32
      LibBlend2D.blArrayGetCapacity(self)
    end

    def reserve(n : Int32) : Bool
      LibBlend2D.blArrayReserve(self, n).success_or_raise
    end

    def item_size : Int32
      LibBlend2D.blArrayGetItemSize(self)
    end

    def <<(value : UInt8) : Bool
      LibBlend2D.blArrayAppendU8(self, value).success_or_raise
    end

    def <<(value : UInt16) : Bool
      LibBlend2D.blArrayAppendU16(self, value).success_or_raise
    end

    def <<(value : UInt32) : Bool
      LibBlend2D.blArrayAppendU32(self, value).success_or_raise
    end

    def <<(value : UInt64) : Bool
      LibBlend2D.blArrayAppendU64(self, value).success_or_raise
    end

    def <<(value : Int8) : Bool
      LibBlend2D.blArrayAppendU8(self, value).success_or_raise
    end

    def <<(value : Int16) : Bool
      LibBlend2D.blArrayAppendU16(self, value).success_or_raise
    end

    def <<(value : Int32) : Bool
      LibBlend2D.blArrayAppendU32(self, value).success_or_raise
    end

    def <<(value : Int64) : Bool
      LibBlend2D.blArrayAppendU64(self, value).success_or_raise
    end

    def <<(value : Float32) : Bool
      LibBlend2D.blArrayAppendF32(self, value).success_or_raise
    end

    def <<(value : Float64) : Bool
      LibBlend2D.blArrayAppendF64(self, value).success_or_raise
    end

    def <<(item : Core) : Bool
      LibBlend2D.blArrayAppendItem(self, item).success_or_raise
    end

    def to_slice : Slice(T)
      Slice.new(Pointer(T).new(data.address), size)
    end

    def to_a : Array(T)
      to_slice.to_a
    end

    def to_a(x : U.class) : Array(U) forall U
      data = LibBlend2D.blArrayGetData self
      pointer = Pointer(LibBlend2D::BLImageCodecCore).new(data.address)
      step = (item_size / sizeof(T)).ceil.to_i

      size.times.map do |i|
        U.new(pointer[i * step])
      end.to_a
    end
  end
end
