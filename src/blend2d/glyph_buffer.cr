module Blend2D
  class GlyphBuffer < Core(LibBlend2D::BLGlyphBufferCore)
    def text=(text : String)
      LibBlend2D.blGlyphBufferSetText(self, text, text.size, TextEncoding::UTF8).success_or_raise
    end

    def glyph_run : GlyphRun
      GlyphRun.new LibBlend2D.blGlyphBufferGetGlyphRun(self).value
    end
  end
end
