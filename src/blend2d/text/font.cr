module Blend2D::Text
  class Font < Core(LibBlend2D::BLFontCore)
    def initialize(face : FontFace, size : Float32)
      LibBlend2D.blFontInit(out @core).success_or_raise
      LibBlend2D.blFontCreateFromFace(self, face, size).success_or_raise
    end

    def finalize
      LibBlend2D.blFontDestroy(self).success_or_raise
    end

    def metrics : FontMetrics
      FontMetrics.new self
    end

    def shape(gb : GlyphBuffer)
      LibBlend2D.blFontShape(self, gb).success_or_raise
    end

    def text_metrics(gb : GlyphBuffer) : TextMetrics
      TextMetrics.new self, gb
    end
  end
end
