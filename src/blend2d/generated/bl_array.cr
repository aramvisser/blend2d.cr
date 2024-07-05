module Blend2D::Global
  class BLArray
    # :nodoc:
    private def reset
      LibBlend2D.blArrayReset(self).success_or_raise
    end

    # :nodoc:
    private def data : Void*
      LibBlend2D.blArrayGetData(self)
    end

    # :nodoc:
    private def clear
      LibBlend2D.blArrayClear(self).success_or_raise
    end

    # :nodoc:
    private def shrink
      LibBlend2D.blArrayShrink(self).success_or_raise
    end

    # :nodoc:
    private def resize(n : Int32, fill : Pointer)
      LibBlend2D.blArrayResize(self, n, fill).success_or_raise
    end

    # :nodoc:
    private def make_mutable(dataOut : Void**)
      LibBlend2D.blArrayMakeMutable(self, dataOut).success_or_raise
    end

    # :nodoc:
    private def modify_op(op : ModifyOp, n : Int32, dataOut : Void**)
      LibBlend2D.blArrayModifyOp(self, op, n, dataOut).success_or_raise
    end

    # :nodoc:
    private def insert_op(index : Int32, n : Int32, dataOut : Void**)
      LibBlend2D.blArrayInsertOp(self, index, n, dataOut).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Array)
      LibBlend2D.blArrayAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Array)
      LibBlend2D.blArrayAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : Array)
      LibBlend2D.blArrayAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_data(data : Pointer, n : Int32)
      LibBlend2D.blArrayAssignData(self, data, n).success_or_raise
    end

    # :nodoc:
    private def assign_external_data(data : Pointer, size : Int32, capacity : Int32, dataAccessFlags : DataAccessFlags, destroyFunc : LibBlend2D::BLDestroyExternalDataFunc, userData : Pointer)
      LibBlend2D.blArrayAssignExternalData(self, data, size, capacity, dataAccessFlags, destroyFunc, userData).success_or_raise
    end

    # :nodoc:
    private def append_data(data : Pointer, n : Int32)
      LibBlend2D.blArrayAppendData(self, data, n).success_or_raise
    end

    # :nodoc:
    private def insert_u8(index : Int32, value : UInt8)
      LibBlend2D.blArrayInsertU8(self, index, value).success_or_raise
    end

    # :nodoc:
    private def insert_u16(index : Int32, value : UInt16)
      LibBlend2D.blArrayInsertU16(self, index, value).success_or_raise
    end

    # :nodoc:
    private def insert_u32(index : Int32, value : UInt32)
      LibBlend2D.blArrayInsertU32(self, index, value).success_or_raise
    end

    # :nodoc:
    private def insert_u64(index : Int32, value : LibC::ULong)
      LibBlend2D.blArrayInsertU64(self, index, value).success_or_raise
    end

    # :nodoc:
    private def insert_f32(index : Int32, value : Float32)
      LibBlend2D.blArrayInsertF32(self, index, value).success_or_raise
    end

    # :nodoc:
    private def insert_f64(index : Int32, value : Float64)
      LibBlend2D.blArrayInsertF64(self, index, value).success_or_raise
    end

    # :nodoc:
    private def insert_item(index : Int32, item : Pointer)
      LibBlend2D.blArrayInsertItem(self, index, item).success_or_raise
    end

    # :nodoc:
    private def insert_data(index : Int32, data : Pointer, n : Int32)
      LibBlend2D.blArrayInsertData(self, index, data, n).success_or_raise
    end

    # :nodoc:
    private def replace_u8(index : Int32, value : UInt8)
      LibBlend2D.blArrayReplaceU8(self, index, value).success_or_raise
    end

    # :nodoc:
    private def replace_u16(index : Int32, value : UInt16)
      LibBlend2D.blArrayReplaceU16(self, index, value).success_or_raise
    end

    # :nodoc:
    private def replace_u32(index : Int32, value : UInt32)
      LibBlend2D.blArrayReplaceU32(self, index, value).success_or_raise
    end

    # :nodoc:
    private def replace_u64(index : Int32, value : LibC::ULong)
      LibBlend2D.blArrayReplaceU64(self, index, value).success_or_raise
    end

    # :nodoc:
    private def replace_f32(index : Int32, value : Float32)
      LibBlend2D.blArrayReplaceF32(self, index, value).success_or_raise
    end

    # :nodoc:
    private def replace_f64(index : Int32, value : Float64)
      LibBlend2D.blArrayReplaceF64(self, index, value).success_or_raise
    end

    # :nodoc:
    private def replace_item(index : Int32, item : Pointer)
      LibBlend2D.blArrayReplaceItem(self, index, item).success_or_raise
    end

    # :nodoc:
    private def replace_data(rStart : Int32, rEnd : Int32, data : Pointer, n : Int32)
      LibBlend2D.blArrayReplaceData(self, rStart, rEnd, data, n).success_or_raise
    end

    # :nodoc:
    private def remove_index(index : Int32)
      LibBlend2D.blArrayRemoveIndex(self, index).success_or_raise
    end

    # :nodoc:
    private def remove_range(rStart : Int32, rEnd : Int32)
      LibBlend2D.blArrayRemoveRange(self, rStart, rEnd).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Array, b : Array) : Int32
      LibBlend2D.blArrayEquals(a, b)
    end
  end
end
