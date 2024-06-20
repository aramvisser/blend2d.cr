module Blend2D::Rendering
  struct ContextHints < BLStruct(LibBlend2D::BLContextHints)
    protected def initialize(@core : T)
    end

    def rendering_quality : RenderingQuality
      RenderingQuality.new @core.hints[ContextHint::RenderingQuality.value]
    end

    def rendering_quality=(rendering_quality : RenderingQuality)
      @core.hints[0] = UInt8.new(rendering_quality.value)
    end

    def gradient_quality : GradientQuality
      GradientQuality.new @core.hints[ContextHint::GradientQuality.value]
    end

    def gradient_quality=(gradient_quality : GradientQuality)
      @core.hints[1] = UInt8.new(gradient_quality.value)
    end

    def pattern_quality : PatternQuality
      PatternQuality.new @core.hints[ContextHint::PatternQuality.value]
    end

    def pattern_quality=(pattern_quality : PatternQuality)
      @core.hints[1] = UInt8.new(pattern_quality.value)
    end
  end
end
