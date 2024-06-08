module Blend2D
  class BLString
    # :nodoc:
    private def initialize
      LibBlend2D.blStringInit(out @core).success_or_raise
    end

    # :nodoc:
    private def initialize(str : UInt8*, size : Int32)
      LibBlend2D.blStringInitWithData(out @core, str, size).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blStringReset(self).success_or_raise
    end

    # :nodoc:
    private def data : UInt8*
      LibBlend2D.blStringGetData(self)
    end

    # :nodoc:
    private def size : Int32
      LibBlend2D.blStringGetSize(self)
    end

    # :nodoc:
    private def capacity : Int32
      LibBlend2D.blStringGetCapacity(self)
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blStringClear(self).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blStringShrink(self).success_or_raise
    end

    # :nodoc:
    private def reserve(n : Int32) : Bool
      LibBlend2D.blStringReserve(self, n).success_or_raise
    end

    # :nodoc:
    private def resize(n : Int32, fill : UInt8) : Bool
      LibBlend2D.blStringResize(self, n, fill).success_or_raise
    end

    # :nodoc:
    private def make_mutable(dataOut : UInt8**) : Bool
      LibBlend2D.blStringMakeMutable(self, dataOut).success_or_raise
    end

    # :nodoc:
    private def modify_op(op : ModifyOp, n : Int32, dataOut : UInt8**) : Bool
      LibBlend2D.blStringModifyOp(self, op, n, dataOut).success_or_raise
    end

    # :nodoc:
    private def insert_op(index : Int32, n : Int32, dataOut : UInt8**) : Bool
      LibBlend2D.blStringInsertOp(self, index, n, dataOut).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : String) : Bool
      LibBlend2D.blStringAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : String) : Bool
      LibBlend2D.blStringAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : String) : Bool
      LibBlend2D.blStringAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_data(str : UInt8*, n : Int32) : Bool
      LibBlend2D.blStringAssignData(self, str, n).success_or_raise
    end

    # :nodoc:
    private def apply_op_char(op : ModifyOp, c : UInt8, n : Int32) : Bool
      LibBlend2D.blStringApplyOpChar(self, op, c, n).success_or_raise
    end

    # :nodoc:
    private def apply_op_data(op : ModifyOp, str : UInt8*, n : Int32) : Bool
      LibBlend2D.blStringApplyOpData(self, op, str, n).success_or_raise
    end

    # :nodoc:
    private def apply_op_string(op : ModifyOp, other : String) : Bool
      LibBlend2D.blStringApplyOpString(self, op, other).success_or_raise
    end

    # :nodoc:
    private def apply_op_format(op : ModifyOp, fmt : UInt8*) : Bool
      LibBlend2D.blStringApplyOpFormat(self, op, fmt).success_or_raise
    end

    # :nodoc:
    private def apply_op_format_v(op : ModifyOp, fmt : UInt8*, ap : Int32) : Bool
      LibBlend2D.blStringApplyOpFormatV(self, op, fmt, ap).success_or_raise
    end

    # :nodoc:
    private def insert_char(index : Int32, c : UInt8, n : Int32) : Bool
      LibBlend2D.blStringInsertChar(self, index, c, n).success_or_raise
    end

    # :nodoc:
    private def insert_data(index : Int32, str : UInt8*, n : Int32) : Bool
      LibBlend2D.blStringInsertData(self, index, str, n).success_or_raise
    end

    # :nodoc:
    private def insert_string(index : Int32, other : String) : Bool
      LibBlend2D.blStringInsertString(self, index, other).success_or_raise
    end

    # :nodoc:
    private def remove_index(index : Int32) : Bool
      LibBlend2D.blStringRemoveIndex(self, index).success_or_raise
    end

    # :nodoc:
    private def remove_range(rStart : Int32, rEnd : Int32) : Bool
      LibBlend2D.blStringRemoveRange(self, rStart, rEnd).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : String, b : String) : Int32
      LibBlend2D.blStringEquals(a, b)
    end

    # :nodoc:
    private def equals_data(str : UInt8*, n : Int32) : Int32
      LibBlend2D.blStringEqualsData(self, str, n)
    end

    # :nodoc:
    private def self.compare(a : String, b : String) : Int32
      LibBlend2D.blStringCompare(a, b)
    end

    # :nodoc:
    private def compare_data(str : UInt8*, n : Int32) : Int32
      LibBlend2D.blStringCompareData(self, str, n)
    end
  end
end
