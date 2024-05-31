module Blend2D
  class Path < Core(LibBlend2D::BLPathCore)
    def initialize
      LibBlend2D.blPathInit(out @core).success_or_raise
    end

    def finalize
      LibBlend2D.blPathDestroy(self).success_or_raise
    end

    def move_to(x0 : Float64, y0 : Float64) : Bool
      LibBlend2D.blPathMoveTo(self, x0, y0).success_or_raise
    end

    def line_to(x1 : Float64, y1 : Float64) : Bool
      LibBlend2D.blPathLineTo(self, x1, y1).success_or_raise
    end

    def quad_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Bool
      LibBlend2D.blPathQuadTo(self, x1, y1, x2, y2).success_or_raise
    end

    def conic_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, w : Float64) : Bool
      LibBlend2D.blPathConicTo(self, x1, y1, x2, y2, w).success_or_raise
    end

    def cubic_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : Bool
      LibBlend2D.blPathCubicTo(self, x1, y1, x2, y2, x3, y3).success_or_raise
    end

    def smooth_quad_to(x2 : Float64, y2 : Float64) : Bool
      LibBlend2D.blPathSmoothQuadTo(self, x2, y2).success_or_raise
    end

    def smooth_cubic_to(x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : Bool
      LibBlend2D.blPathSmoothCubicTo(self, x2, y2, x3, y3).success_or_raise
    end

    def arc_to(x : Float64, y : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, forceMoveTo : Int32) : Bool
      LibBlend2D.blPathArcTo(self, x, y, rx, ry, start, sweep, forceMoveTo).success_or_raise
    end

    def arc_quadrant_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Bool
      LibBlend2D.blPathArcQuadrantTo(self, x1, y1, x2, y2).success_or_raise
    end

    def elliptic_arc_to(rx : Float64, ry : Float64, xAxisRotation : Float64, largeArcFlag : Int32, sweepFlag : Int32, x1 : Float64, y1 : Float64) : Bool
      LibBlend2D.blPathEllipticArcTo(self, rx, ry, xAxisRotation, largeArcFlag, sweepFlag, x1, y1).success_or_raise
    end

    def close : Bool
      LibBlend2D.blPathClose(self).success_or_raise
    end
  end
end
