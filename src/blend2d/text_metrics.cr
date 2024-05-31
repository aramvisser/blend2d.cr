module Blend2D
  struct TextMetrics < BLStruct(LibBlend2D::BLTextMetrics)
    delegate :advance, :leading_bearing, :trailing_bearing, :bounding_box, to: @core

    def initialize(font : Font, gb : GlyphBuffer)
      LibBlend2D.blFontGetTextMetrics(font, gb, out @core).success_or_raise
    end
  end
end
