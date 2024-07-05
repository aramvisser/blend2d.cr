module Blend2D::Global
  struct BLRange < BLStruct(LibBlend2D::BLRange)
    delegate :begin, :end, to: @core

    def initialize(range : Range(Int32, Int32))
      last = range.excludes_end? ? range.end - 1 : range.end

      @core = LibBlend2D::BLRange.new start: range.begin, _end: last
    end
  end
end
