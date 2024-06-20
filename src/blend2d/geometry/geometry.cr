module Blend2D::Geometry
  abstract class Core(T)
    @core = uninitialized T

    getter type : GeometryType = GeometryType::None

    def initialize(@core : T)
    end

    def to_unsafe
      pointerof(@core)
    end

    def pointer
      pointerof(@core)
    end
  end

  class Arc < Core(LibBlend2D::BLArc)
    @type = GeometryType::Arc

    delegate :cx, :cy, :rx, :ry, to: @core

    def initialize(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64)
      @core = LibBlend2D::BLArc.new cx: cx, cy: cy, rx: rx, ry: ry, start: start, sweep: sweep
    end
  end

  class Box < Geometry::Core(LibBlend2D::BLBox)
    @type = GeometryType::Boxd

    delegate :x0, :y0, :x1, :y1, to: @core

    def initialize(@core : T)
    end

    def initialize(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64)
      @core = LibBlend2D::BLBox.new x0: x0, y0: y0, x1: x1, y1: y1
    end
  end

  class BoxI < Geometry::Core(LibBlend2D::BLBoxI)
    @type = GeometryType::Boxi

    delegate :x0, :y0, :x1, :y1, to: @core

    def initialize(@core : T)
    end

    def initialize(x0 : Int32, y0 : Int32, x1 : Int32, y1 : Int32)
      @core = LibBlend2D::BLBoxI.new x0: x0, y0: y0, x1: x1, y1: y1
    end
  end

  class Circle < Core(LibBlend2D::BLCircle)
    @type = GeometryType::Circle

    delegate :cx, :cy, :r, to: @core

    def initialize(cx : Float64, cy : Float64, r : Float64)
      @core = LibBlend2D::BLCircle.new cx: cx, cy: cy, r: r
    end
  end

  class Chord < Arc
    @type = GeometryType::Chord
  end

  class Ellipse < Core(LibBlend2D::BLEllipse)
    @type = GeometryType::Ellipse

    delegate :cx, :cy, :rx, :ry, to: @core

    def initialize(cx : Float64, cy : Float64, rx : Float64, ry : Float64)
      @core = LibBlend2D::BLEllipse.new cx: cx, cy: cy, rx: rx, ry: ry
    end
  end

  class Line < Geometry::Core(LibBlend2D::BLLine)
    @type = GeometryType::Line

    delegate :x0, :y0, :x1, :y1, to: @core

    def initialize(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64)
      @core = LibBlend2D::BLLine.new x0: x0, y0: y0, x1: x1, y1: y1
    end
  end

  class Pie < Arc
    @type = GeometryType::Pie
  end

  class Rect < Core(LibBlend2D::BLRect)
    @type = GeometryType::Rectd

    delegate :x, :y, :w, :h, to: @core

    def initialize(@core : LibBlend2D::BLRect)
    end

    def initialize(x : Float64, y : Float64, w : Float64, h : Float64)
      @core = LibBlend2D::BLRect.new x: x, y: y, w: w, h: h
    end
  end

  class RectI < Core(LibBlend2D::BLRectI)
    @type = GeometryType::Recti

    delegate :x, :y, :w, :h, to: @core

    def initialize(@core : LibBlend2D::BLRectI)
    end

    def initialize(x : Int32, y : Int32, w : Int32, h : Int32)
      @core = LibBlend2D::BLRectI.new x: x, y: y, w: w, h: h
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

  class Triangle < Geometry::Core(LibBlend2D::BLTriangle)
    @type = GeometryType::Triangle

    delegate :x0, :y0, :x1, :y1, :x2, :y2, to: @core

    def initialize(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64)
      @core = LibBlend2D::BLTriangle.new x0: x0, y0: y0, x1: x1, y1: y1, x2: x2, y2: y2
    end
  end
end
