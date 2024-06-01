module Blend2D
  struct TextMetrics < BLStruct(LibBlend2D::BLTextMetrics)
    def initialize(font : Font, gb : GlyphBuffer)
      LibBlend2D.blFontGetTextMetrics(font, gb, out @core).success_or_raise
    end

    def advance : Point
      Point.new @core.advance
    end

    def leading_bearing : Point
      Point.new @core.leading_bearing
    end

    def trailing_bearing : Point
      Point.new @core.trailing_bearing
    end

    def bounding_box
      Box.new @core.bounding_box
    end
  end
end
