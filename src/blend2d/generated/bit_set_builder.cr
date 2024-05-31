module Blend2D
  class BitSetBuilder
    # :nodoc:
    def self.commit(self_ : BitSet, builder : BitSetBuilder, newAreaIndex : UInt32) : Bool
      LibBlend2D.blBitSetBuilderCommit(self_, builder, newAreaIndex).success_or_raise
    end

    # :nodoc:
    def self.add_range(self_ : BitSet, builder : BitSetBuilder, startBit : UInt32, endBit : UInt32) : Bool
      LibBlend2D.blBitSetBuilderAddRange(self_, builder, startBit, endBit).success_or_raise
    end
  end
end
