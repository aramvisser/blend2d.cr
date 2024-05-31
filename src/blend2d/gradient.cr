module Blend2D
  class Gradient < Core(LibBlend2D::BLGradientCore)
    struct Linear
      @core : LibBlend2D::BLLinearGradientValues

      def initialize(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64)
        @core = LibBlend2D::BLLinearGradientValues.new x0: x0, y0: y0, x1: x1, y1: y1
      end

      def to_unsafe
        pointerof(@core)
      end

      def type
        GradientType::Linear
      end
    end

    struct Radial
      @core : LibBlend2D::BLRadialGradientValues

      def initialize(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, r0 : Float64)
        @core = LibBlend2D::BLRadialGradientValues.new x0: x0, y0: y0, x1: x1, y1: y1, r0: r0
      end

      def to_unsafe
        pointerof(@core)
      end

      def type
        GradientType::Radial
      end
    end

    struct Conic
      @core : LibBlend2D::BLConicGradientValues

      def initialize(x0 : Float64, y0 : Float64, angle : Float64)
        @core = LibBlend2D::BLConicGradientValues.new x0: x0, y0: y0, angle: angle
      end

      def to_unsafe
        pointerof(@core)
      end

      def type
        GradientType::Conic
      end
    end

    def self.linear(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, extend_mode : ExtendMode = ExtendMode::Pad)
      new Linear.new(x0, y0, x1, y1), extend_mode
    end

    def self.radial(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, r0 : Float64, extend_mode : ExtendMode = ExtendMode::Pad)
      new Radial.new(x0, y0, x1, y1, r0), extend_mode
    end

    def self.radial(x0 : Float64, y0 : Float64, angle : Float64, extend_mode : ExtendMode = ExtendMode::Pad)
      new Conic.new(x0, y0, angle), extend_mode
    end

    def initialize(gradient : Linear|Radial|Conic, extend_mode : ExtendMode = ExtendMode::Pad)
      LibBlend2D.blGradientInitAs(
        out @core,
        gradient.type,
        gradient,
        extend_mode,
        nil, 0, nil,
      ).success_or_raise
    end

    def finalize
      LibBlend2D.blGradientDestroy(self).success_or_raise
    end

    def extend_mode : ExtendMode
      LibBlend2D.blGradientGetExtendMode(self)
    end

    def extend_mode=(extendMode : ExtendMode)
      LibBlend2D.blGradientSetExtendMode(self, extendMode).success_or_raise
    end

    def add_stop(offset : Float64, rgba32 : RGBA32) : Bool
      LibBlend2D.blGradientAddStopRgba32(self, offset, rgba32.packed).success_or_raise
    end

    def add_stop(offset : Float64, rgba64 : RGBA64) : Bool
      LibBlend2D.blGradientAddStopRgba64(self, offset, rgba64.packed).success_or_raise
    end

    def add_stop(offset : Float64, argb32 : UInt32) : Bool
      LibBlend2D.blGradientAddStopRgba32(self, offset, argb32).success_or_raise
    end
  end
end
