module Blend2D::Global
  class BitSet
    # :nodoc:
    private def initialize
      LibBlend2D.blBitSetInit(out @core).success_or_raise
    end

    # :nodoc:
    private def initialize(startBit : UInt32, endBit : UInt32)
      LibBlend2D.blBitSetInitRange(out @core, startBit, endBit).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blBitSetDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blBitSetReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : BitSet) : Bool
      LibBlend2D.blBitSetAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : BitSet) : Bool
      LibBlend2D.blBitSetAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : BitSet) : Bool
      LibBlend2D.blBitSetAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_range(startBit : UInt32, endBit : UInt32) : Bool
      LibBlend2D.blBitSetAssignRange(self, startBit, endBit).success_or_raise
    end

    # :nodoc:
    private def assign_words(startWord : UInt32, wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitSetAssignWords(self, startWord, wordData, wordCount).success_or_raise
    end

    # :nodoc:
    private def is_empty : Int32
      LibBlend2D.blBitSetIsEmpty(self)
    end

    # :nodoc:
    private def get_data(out_ : LibBlend2D::BLBitSetData*) : Bool
      LibBlend2D.blBitSetGetData(self, out_).success_or_raise
    end

    # :nodoc:
    private def segment_count : UInt32
      LibBlend2D.blBitSetGetSegmentCount(self)
    end

    # :nodoc:
    private def segment_capacity : UInt32
      LibBlend2D.blBitSetGetSegmentCapacity(self)
    end

    # :nodoc:
    private def cardinality : UInt32
      LibBlend2D.blBitSetGetCardinality(self)
    end

    # :nodoc:
    private def get_cardinality_in_range(startBit : UInt32, endBit : UInt32) : UInt32
      LibBlend2D.blBitSetGetCardinalityInRange(self, startBit, endBit)
    end

    # :nodoc:
    private def has_bit(bitIndex : UInt32) : Int32
      LibBlend2D.blBitSetHasBit(self, bitIndex)
    end

    # :nodoc:
    private def has_bits_in_range(startBit : UInt32, endBit : UInt32) : Int32
      LibBlend2D.blBitSetHasBitsInRange(self, startBit, endBit)
    end

    # :nodoc:
    private def self.subsumes(a : BitSet, b : BitSet) : Int32
      LibBlend2D.blBitSetSubsumes(a, b)
    end

    # :nodoc:
    private def self.intersects(a : BitSet, b : BitSet) : Int32
      LibBlend2D.blBitSetIntersects(a, b)
    end

    # :nodoc:
    private def get_range(startOut : UInt32*, endOut : UInt32*) : Int32
      LibBlend2D.blBitSetGetRange(self, startOut, endOut)
    end

    # :nodoc:
    private def self.equals(a : BitSet, b : BitSet) : Int32
      LibBlend2D.blBitSetEquals(a, b)
    end

    # :nodoc:
    private def self.compare(a : BitSet, b : BitSet) : Int32
      LibBlend2D.blBitSetCompare(a, b)
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blBitSetClear(self).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blBitSetShrink(self).success_or_raise
    end

    # :nodoc:
    private def optimize : Bool
      LibBlend2D.blBitSetOptimize(self).success_or_raise
    end

    # :nodoc:
    private def chop(startBit : UInt32, endBit : UInt32) : Bool
      LibBlend2D.blBitSetChop(self, startBit, endBit).success_or_raise
    end

    # :nodoc:
    private def add_bit(bitIndex : UInt32) : Bool
      LibBlend2D.blBitSetAddBit(self, bitIndex).success_or_raise
    end

    # :nodoc:
    private def add_range(rangeStartBit : UInt32, rangeEndBit : UInt32) : Bool
      LibBlend2D.blBitSetAddRange(self, rangeStartBit, rangeEndBit).success_or_raise
    end

    # :nodoc:
    private def add_words(startWord : UInt32, wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitSetAddWords(self, startWord, wordData, wordCount).success_or_raise
    end

    # :nodoc:
    private def clear_bit(bitIndex : UInt32) : Bool
      LibBlend2D.blBitSetClearBit(self, bitIndex).success_or_raise
    end

    # :nodoc:
    private def clear_range(rangeStartBit : UInt32, rangeEndBit : UInt32) : Bool
      LibBlend2D.blBitSetClearRange(self, rangeStartBit, rangeEndBit).success_or_raise
    end
  end
end
