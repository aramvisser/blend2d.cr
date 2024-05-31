module Blend2D
  module Geometry
    abstract class Core(T)
      @core = uninitialized T

      getter type : GeometryType = GeometryType::None

      def initialize(@core : T)
      end

      def to_unsafe : Pointer(T)
        pointerof(@core)
      end
    end

    class Circle < Core(LibBlend2D::BLCircle)
      @type = GeometryType::Circle

      delegate :cx, :cy, :r, to: @core

      def initialize(cx : Float64, cy : Float64, r : Float64)
        @core = LibBlend2D::BLCircle.new cx: cx, cy: cy, r: r
      end
    end

    class RoundRect < Core(LibBlend2D::BLRoundRect)
      @type = GeometryType::RoundRect

      delegate :x, :y, :w, :h, :rx, :ry, to: @core

      def initialize(x : Float64, y : Float64, w : Float64, h : Float64, r : Float64)
        initialize x, y, w, h, r, r
      end

      def initialize(x : Float64, y : Float64, w : Float64, h : Float64, rx : Float64, ry : Float64)
        @core = LibBlend2D::BLRoundRect.new x: x, y: y, w: w, h: h, rx: rx, ry: ry
      end
    end
  end
end
