module Blend2D
  class BitArray
    # :nodoc:
    private def initialize
      LibBlend2D.blBitArrayInit(out @core).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blBitArrayDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blBitArrayReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : BitArray) : Bool
      LibBlend2D.blBitArrayAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : BitArray) : Bool
      LibBlend2D.blBitArrayAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_words(wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitArrayAssignWords(self, wordData, wordCount).success_or_raise
    end

    # :nodoc:
    private def is_empty : Int32
      LibBlend2D.blBitArrayIsEmpty(self)
    end

    # :nodoc:
    private def size : UInt32
      LibBlend2D.blBitArrayGetSize(self)
    end

    # :nodoc:
    private def word_count : UInt32
      LibBlend2D.blBitArrayGetWordCount(self)
    end

    # :nodoc:
    private def capacity : UInt32
      LibBlend2D.blBitArrayGetCapacity(self)
    end

    # :nodoc:
    private def data : UInt32*
      LibBlend2D.blBitArrayGetData(self)
    end

    # :nodoc:
    private def cardinality : UInt32
      LibBlend2D.blBitArrayGetCardinality(self)
    end

    # :nodoc:
    private def get_cardinality_in_range(startBit : UInt32, endBit : UInt32) : UInt32
      LibBlend2D.blBitArrayGetCardinalityInRange(self, startBit, endBit)
    end

    # :nodoc:
    private def has_bit(bitIndex : UInt32) : Int32
      LibBlend2D.blBitArrayHasBit(self, bitIndex)
    end

    # :nodoc:
    private def has_bits_in_range(startBit : UInt32, endBit : UInt32) : Int32
      LibBlend2D.blBitArrayHasBitsInRange(self, startBit, endBit)
    end

    # :nodoc:
    private def self.subsumes(a : BitArray, b : BitArray) : Int32
      LibBlend2D.blBitArraySubsumes(a, b)
    end

    # :nodoc:
    private def self.intersects(a : BitArray, b : BitArray) : Int32
      LibBlend2D.blBitArrayIntersects(a, b)
    end

    # :nodoc:
    private def get_range(startOut : UInt32*, endOut : UInt32*) : Int32
      LibBlend2D.blBitArrayGetRange(self, startOut, endOut)
    end

    # :nodoc:
    private def self.equals(a : BitArray, b : BitArray) : Int32
      LibBlend2D.blBitArrayEquals(a, b)
    end

    # :nodoc:
    private def self.compare(a : BitArray, b : BitArray) : Int32
      LibBlend2D.blBitArrayCompare(a, b)
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blBitArrayClear(self).success_or_raise
    end

    # :nodoc:
    private def resize(nBits : UInt32) : Bool
      LibBlend2D.blBitArrayResize(self, nBits).success_or_raise
    end

    # :nodoc:
    private def reserve(nBits : UInt32) : Bool
      LibBlend2D.blBitArrayReserve(self, nBits).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blBitArrayShrink(self).success_or_raise
    end

    # :nodoc:
    private def bit=(bitIndex : UInt32)
      LibBlend2D.blBitArraySetBit(self, bitIndex).success_or_raise
    end

    # :nodoc:
    private def fill_range(startBit : UInt32, endBit : UInt32) : Bool
      LibBlend2D.blBitArrayFillRange(self, startBit, endBit).success_or_raise
    end

    # :nodoc:
    private def fill_words(bitIndex : UInt32, wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitArrayFillWords(self, bitIndex, wordData, wordCount).success_or_raise
    end

    # :nodoc:
    private def clear_bit(bitIndex : UInt32) : Bool
      LibBlend2D.blBitArrayClearBit(self, bitIndex).success_or_raise
    end

    # :nodoc:
    private def clear_range(startBit : UInt32, endBit : UInt32) : Bool
      LibBlend2D.blBitArrayClearRange(self, startBit, endBit).success_or_raise
    end

    # :nodoc:
    private def clear_word(bitIndex : UInt32, wordValue : UInt32) : Bool
      LibBlend2D.blBitArrayClearWord(self, bitIndex, wordValue).success_or_raise
    end

    # :nodoc:
    private def clear_words(bitIndex : UInt32, wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitArrayClearWords(self, bitIndex, wordData, wordCount).success_or_raise
    end

    # :nodoc:
    private def replace_op(nBits : UInt32, dataOut : UInt32**) : Bool
      LibBlend2D.blBitArrayReplaceOp(self, nBits, dataOut).success_or_raise
    end

    # :nodoc:
    private def replace_bit(bitIndex : UInt32, bitValue : Int32) : Bool
      LibBlend2D.blBitArrayReplaceBit(self, bitIndex, bitValue).success_or_raise
    end

    # :nodoc:
    private def replace_word(bitIndex : UInt32, wordValue : UInt32) : Bool
      LibBlend2D.blBitArrayReplaceWord(self, bitIndex, wordValue).success_or_raise
    end

    # :nodoc:
    private def replace_words(bitIndex : UInt32, wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitArrayReplaceWords(self, bitIndex, wordData, wordCount).success_or_raise
    end

    # :nodoc:
    private def append_bit(bitValue : Int32) : Bool
      LibBlend2D.blBitArrayAppendBit(self, bitValue).success_or_raise
    end

    # :nodoc:
    private def append_word(wordValue : UInt32) : Bool
      LibBlend2D.blBitArrayAppendWord(self, wordValue).success_or_raise
    end

    # :nodoc:
    private def append_words(wordData : UInt32*, wordCount : UInt32) : Bool
      LibBlend2D.blBitArrayAppendWords(self, wordData, wordCount).success_or_raise
    end
  end
end
