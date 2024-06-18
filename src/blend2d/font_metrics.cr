module Blend2D
  struct FontMetrics < BLStruct(LibBlend2D::BLFontMetrics)
    delegate :size,
      :ascent_by_orientation,
      :descent_by_orientation,
      :line_gap,
      :x_height,
      :cap_height,
      :x_min,
      :y_min,
      :x_max,
      :y_max,
      :underline_position,
      :underline_thickness,
      :strikethrough_position,
      :strikethrough_thickness,
      to: @core

    def initialize(font : Font)
      LibBlend2D.blFontGetMetrics(font, out @core).success_or_raise
    end

    def ascent : Float32
      @core.ascent_by_orientation[0]
    end

    def v_ascent : Float32
      @core.ascent_by_orientation[1]
    end

    def descent : Float32
      @core.descent_by_orientation[0]
    end

    def v_descent : Float32
      @core.descent_by_orientation[1]
    end
  end
end
