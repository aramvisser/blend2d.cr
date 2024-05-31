module Blend2D
  class BLArray
    # :nodoc:
    def initialize(arrayType : ObjectType)
      LibBlend2D.blArrayInit(out @core, arrayType).success_or_raise
    end

    # :nodoc:
    def finalize
      LibBlend2D.blArrayDestroy(self).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blArrayReset(self).success_or_raise
    end

    # :nodoc:
    def size : Int32
      LibBlend2D.blArrayGetSize(self)
    end

    # :nodoc:
    def capacity : Int32
      LibBlend2D.blArrayGetCapacity(self)
    end

    # :nodoc:
    def item_size : Int32
      LibBlend2D.blArrayGetItemSize(self)
    end

    # :nodoc:
    def data : Void*
      LibBlend2D.blArrayGetData(self)
    end

    # :nodoc:
    def clear : Bool
      LibBlend2D.blArrayClear(self).success_or_raise
    end

    # :nodoc:
    def shrink : Bool
      LibBlend2D.blArrayShrink(self).success_or_raise
    end

    # :nodoc:
    def reserve(n : Int32) : Bool
      LibBlend2D.blArrayReserve(self, n).success_or_raise
    end

    # :nodoc:
    def resize(n : Int32, fill : Pointer) : Bool
      LibBlend2D.blArrayResize(self, n, fill).success_or_raise
    end

    # :nodoc:
    def make_mutable(dataOut : Void**) : Bool
      LibBlend2D.blArrayMakeMutable(self, dataOut).success_or_raise
    end

    # :nodoc:
    def modify_op(op : ModifyOp, n : Int32, dataOut : Void**) : Bool
      LibBlend2D.blArrayModifyOp(self, op, n, dataOut).success_or_raise
    end

    # :nodoc:
    def insert_op(index : Int32, n : Int32, dataOut : Void**) : Bool
      LibBlend2D.blArrayInsertOp(self, index, n, dataOut).success_or_raise
    end

    # :nodoc:
    def assign_move(other : Array) : Bool
      LibBlend2D.blArrayAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : Array) : Bool
      LibBlend2D.blArrayAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def assign_deep(other : Array) : Bool
      LibBlend2D.blArrayAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    def assign_data(data : Pointer, n : Int32) : Bool
      LibBlend2D.blArrayAssignData(self, data, n).success_or_raise
    end

    # :nodoc:
    def assign_external_data(data : Pointer, size : Int32, capacity : Int32, dataAccessFlags : DataAccessFlags, destroyFunc : LibBlend2D::BLDestroyExternalDataFunc, userData : Pointer) : Bool
      LibBlend2D.blArrayAssignExternalData(self, data, size, capacity, dataAccessFlags, destroyFunc, userData).success_or_raise
    end

    # :nodoc:
    def append_u8(value : UInt8) : Bool
      LibBlend2D.blArrayAppendU8(self, value).success_or_raise
    end

    # :nodoc:
    def append_u16(value : UInt16) : Bool
      LibBlend2D.blArrayAppendU16(self, value).success_or_raise
    end

    # :nodoc:
    def append_u32(value : UInt32) : Bool
      LibBlend2D.blArrayAppendU32(self, value).success_or_raise
    end

    # :nodoc:
    def append_u64(value : LibC::ULong) : Bool
      LibBlend2D.blArrayAppendU64(self, value).success_or_raise
    end

    # :nodoc:
    def append_f32(value : Float32) : Bool
      LibBlend2D.blArrayAppendF32(self, value).success_or_raise
    end

    # :nodoc:
    def append_f64(value : Float64) : Bool
      LibBlend2D.blArrayAppendF64(self, value).success_or_raise
    end

    # :nodoc:
    def append_item(item : Pointer) : Bool
      LibBlend2D.blArrayAppendItem(self, item).success_or_raise
    end

    # :nodoc:
    def append_data(data : Pointer, n : Int32) : Bool
      LibBlend2D.blArrayAppendData(self, data, n).success_or_raise
    end

    # :nodoc:
    def insert_u8(index : Int32, value : UInt8) : Bool
      LibBlend2D.blArrayInsertU8(self, index, value).success_or_raise
    end

    # :nodoc:
    def insert_u16(index : Int32, value : UInt16) : Bool
      LibBlend2D.blArrayInsertU16(self, index, value).success_or_raise
    end

    # :nodoc:
    def insert_u32(index : Int32, value : UInt32) : Bool
      LibBlend2D.blArrayInsertU32(self, index, value).success_or_raise
    end

    # :nodoc:
    def insert_u64(index : Int32, value : LibC::ULong) : Bool
      LibBlend2D.blArrayInsertU64(self, index, value).success_or_raise
    end

    # :nodoc:
    def insert_f32(index : Int32, value : Float32) : Bool
      LibBlend2D.blArrayInsertF32(self, index, value).success_or_raise
    end

    # :nodoc:
    def insert_f64(index : Int32, value : Float64) : Bool
      LibBlend2D.blArrayInsertF64(self, index, value).success_or_raise
    end

    # :nodoc:
    def insert_item(index : Int32, item : Pointer) : Bool
      LibBlend2D.blArrayInsertItem(self, index, item).success_or_raise
    end

    # :nodoc:
    def insert_data(index : Int32, data : Pointer, n : Int32) : Bool
      LibBlend2D.blArrayInsertData(self, index, data, n).success_or_raise
    end

    # :nodoc:
    def replace_u8(index : Int32, value : UInt8) : Bool
      LibBlend2D.blArrayReplaceU8(self, index, value).success_or_raise
    end

    # :nodoc:
    def replace_u16(index : Int32, value : UInt16) : Bool
      LibBlend2D.blArrayReplaceU16(self, index, value).success_or_raise
    end

    # :nodoc:
    def replace_u32(index : Int32, value : UInt32) : Bool
      LibBlend2D.blArrayReplaceU32(self, index, value).success_or_raise
    end

    # :nodoc:
    def replace_u64(index : Int32, value : LibC::ULong) : Bool
      LibBlend2D.blArrayReplaceU64(self, index, value).success_or_raise
    end

    # :nodoc:
    def replace_f32(index : Int32, value : Float32) : Bool
      LibBlend2D.blArrayReplaceF32(self, index, value).success_or_raise
    end

    # :nodoc:
    def replace_f64(index : Int32, value : Float64) : Bool
      LibBlend2D.blArrayReplaceF64(self, index, value).success_or_raise
    end

    # :nodoc:
    def replace_item(index : Int32, item : Pointer) : Bool
      LibBlend2D.blArrayReplaceItem(self, index, item).success_or_raise
    end

    # :nodoc:
    def replace_data(rStart : Int32, rEnd : Int32, data : Pointer, n : Int32) : Bool
      LibBlend2D.blArrayReplaceData(self, rStart, rEnd, data, n).success_or_raise
    end

    # :nodoc:
    def remove_index(index : Int32) : Bool
      LibBlend2D.blArrayRemoveIndex(self, index).success_or_raise
    end

    # :nodoc:
    def remove_range(rStart : Int32, rEnd : Int32) : Bool
      LibBlend2D.blArrayRemoveRange(self, rStart, rEnd).success_or_raise
    end

    # :nodoc:
    def self.equals(a : Array, b : Array) : Int32
      LibBlend2D.blArrayEquals(a, b)
    end
  end
end
