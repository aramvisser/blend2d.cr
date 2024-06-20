module Blend2D::Text
  class GlyphBuffer < Core(LibBlend2D::BLGlyphBufferCore)
    def initialize
      LibBlend2D.blGlyphBufferInit(out @core).success_or_raise
    end

    def initialize(text : String)
      initialize
      self.text = text
    end

    def finalize
      LibBlend2D.blGlyphBufferDestroy(self).success_or_raise
    end

    def text=(text : String)
      LibBlend2D.blGlyphBufferSetText(self, text, text.size, TextEncoding::UTF8).success_or_raise
    end

    def glyph_run : GlyphRun
      GlyphRun.new LibBlend2D.blGlyphBufferGetGlyphRun(self).value
    end
  end
end
