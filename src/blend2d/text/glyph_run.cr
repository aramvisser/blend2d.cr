module Blend2D::Text
  struct GlyphRun < BLStruct(LibBlend2D::BLGlyphRun)
    delegate :glyph_data,
      :placement_data,
      :size,
      :reserved,
      :placement_type,
      :glyph_advance,
      :placement_advance,
      :flags,
      to: @core
  end
end
