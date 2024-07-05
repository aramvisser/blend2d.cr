module Blend2D::Geometry
  class Path < Core(LibBlend2D::BLPathCore)
    def initialize
      LibBlend2D.blPathInit(out @core).success_or_raise
    end

    def finalize
      LibBlend2D.blPathDestroy(self).success_or_raise
    end

    def size : Int32
      LibBlend2D.blPathGetSize self
    end

    def capacity : Int32
      LibBlend2D.blPathGetCapacity self
    end

    def command_data : Bytes
      pointer = LibBlend2D.blPathGetCommandData self
      Bytes.new pointer, size
    end

    def vertex_data : Slice(Point)
      pointer = LibBlend2D.blPathGetVertexData self
      Slice(Point).new pointer.as(Pointer(Point)), size
    end

    def clear : Bool
      LibBlend2D.blPathClear(self).success_or_raise
    end

    def shrink : Bool
      LibBlend2D.blPathShrink(self).success_or_raise
    end

    def reserve(n : Int32) : Bool
      LibBlend2D.blPathReserve(self, n).success_or_raise
    end

    def move_to(p0 : Point) : Bool
      move_to point.x, point.y
    end

    def move_to(x0 : Float64, y0 : Float64) : Bool
      LibBlend2D.blPathMoveTo(self, x0, y0).success_or_raise
    end

    def line_to(p1 : Point) : Bool
      lint_to line.x, line.y
    end

    def line_to(x1 : Float64, y1 : Float64) : Bool
      LibBlend2D.blPathLineTo(self, x1, y1).success_or_raise
    end

    def poly_to(poly : Array(Point)) : Bool
      LibBlend2D.blPathPolyTo(self, poly.to_unsafe.as(Pointer(LibBlend2D::BLPoint)), poly.size).success_or_raise
    end

    def quad_to(p1 : Point, p2 : Point) : Bool
      quad_to p1.x, p1.y, p2.x, p2.y
    end

    def quad_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Bool
      LibBlend2D.blPathQuadTo(self, x1, y1, x2, y2).success_or_raise
    end

    def conic_to(p1 : Point, p2 : Point, w : Float64) : Bool
      conic_to p1.x, p1.y, p2.x, p2.y, w
    end

    def conic_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, w : Float64) : Bool
      LibBlend2D.blPathConicTo(self, x1, y1, x2, y2, w).success_or_raise
    end

    def cubic_to(p1 : Point, p2 : Point, p3 : Point) : Bool
      conic_to p1.x, p1.y, p2.x, p2.y, p3.x, p3.y
    end

    def cubic_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : Bool
      LibBlend2D.blPathCubicTo(self, x1, y1, x2, y2, x3, y3).success_or_raise
    end

    def smooth_quad_to(p2 : Point) : Bool
      smooth_quad_to p2.x, p2.y
    end

    def smooth_quad_to(x2 : Float64, y2 : Float64) : Bool
      LibBlend2D.blPathSmoothQuadTo(self, x2, y2).success_or_raise
    end

    def smooth_cubic_to(p2 : Point, p3 : Point) : Bool
      smooth_cubic_to p2.x, p2.y, p3.x, p3.y
    end

    def smooth_cubic_to(x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : Bool
      LibBlend2D.blPathSmoothCubicTo(self, x2, y2, x3, y3).success_or_raise
    end

    def arc_to(c : Point, r : Point, start : Float64, sweep : Float64, force_move_to : Bool) : Bool
      arc_to c.x, c.y, r.x, r.y, start, sweep, force_move_to
    end

    def arc_to(x : Float64, y : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, force_move_to : Bool) : Bool
      LibBlend2D.blPathArcTo(self, x, y, rx, ry, start, sweep, forceMoveTo).success_or_raise
    end

    def arc_quadrant_to(p1 : Point, p2 : Point) : Bool
      arc_quadrant_to p1.x, p1.y, p2.x, p2.y
    end

    def arc_quadrant_to(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : Bool
      LibBlend2D.blPathArcQuadrantTo(self, x1, y1, x2, y2).success_or_raise
    end

    def elliptic_arc_to(rp : Point, x_axis_rotation : Float64, large_arc_flag : Bool, sweep_flag : Bool, p1 : Point) : Bool
      LibBlend2D.blPathEllipticArcTo(self, rp.x, rp.y, x_axis_rotation, large_arc_flag, sweep_flag, p1.x, p1.y).success_or_raise
    end

    def elliptic_arc_to(rx : Float64, ry : Float64, x_axis_rotation : Float64, large_arc_flag : Bool, sweep_flag : Bool, x1 : Float64, y1 : Float64) : Bool
      LibBlend2D.blPathEllipticArcTo(self, rx, ry, x_axis_rotation, large_arc_flag, sweep_flag, x1, y1).success_or_raise
    end

    def close : Bool
      LibBlend2D.blPathClose(self).success_or_raise
    end

    def add_box(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_box Box.new(x1, y1, x2, y2), dir
    end

    def add_box(box : Box | BoxI, dir : GeometryDirection = GeometryDirection::CW) : Bool
      case box
      in Box
        LibBlend2D.blPathAddBoxD(self, box, dir).success_or_raise
      in BoxI
        LibBlend2D.blPathAddBoxI(self, box, dir).success_or_raise
      end
    end

    def add_rect(x : Float64, y : Float64, w : Float64, h : Float64, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_rect Rect.new(x, y, w, h), dir
    end

    def add_rect(rect : Rect | RectI, dir : GeometryDirection = GeometryDirection::CW) : Bool
      case rect
      in Rect
        LibBlend2D.blPathAddRectD(self, rect, dir).success_or_raise
      in RectI
        LibBlend2D.blPathAddRectI(self, rect, dir).success_or_raise
      end
    end

    def add_geometry(geometry : Geometry::Core, m : Matrix2D, dir : GeometryDirection = Geometry::CW) : Bool
      LibBlend2D.blPathAddGeometry(self, geometry.type, geometry.to_unsafe, m, dir).success_or_raise
    end

    def add_geometry(geometry : Geometry::Core, dir : GeometryDirection = GeometryDirection::CW) : Bool
      LibBlend2D.blPathAddGeometry(self, geometry.type, geometry.to_unsafe, nil, dir).success_or_raise
    end

    def add_circle(circle : Circle, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry circle, dir
    end

    def add_circle(circle : Circle, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry circle, transform, dir
    end

    def add_ellipse(ellipse : Ellipse, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry ellipse, dir
    end

    def add_ellipse(ellipse : Ellipse, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry ellipse, transform, dir
    end

    def add_round_rect(round_rect : RoundRect, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry round_rect, dir
    end

    def add_round_rect(round_rect : RoundRect, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry round_rect, transform, dir
    end

    def add_arc(arc : Arc, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry arc, dir
    end

    def add_arc(arc : Arc, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry arc, transform, dir
    end

    def add_chord(chord : Chord, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry chord, dir
    end

    def add_chord(chord : Chord, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry chord, transform, dir
    end

    def add_pie(pie : Pie, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry pie, dir
    end

    def add_pie(pie : Pie, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry pie, transform, dir
    end

    def add_line(line : Line, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry line, dir
    end

    def add_line(line : Line, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry line, transform, dir
    end

    def add_triangle(triangle : Triangle, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry triangle, dir
    end

    def add_triangle(triangle : Triangle, transform : Matrix2D, dir : GeometryDirection = GeometryDirection::CW) : Bool
      add_geometry triangle, transform, dir
    end

    def add_path(path : Path) : Bool
      LibBlend2D.blPathAddPath(self, path, nil).success_or_raise
    end

    def add_path(path : Path, range : Range(Int32, Int32)) : Bool
      LibBlend2D.blPathAddPath(self, path, BLRange.new(range)).success_or_raise
    end

    def add_path(path : Path, p : Point) : Bool
      LibBlend2D.blPathAddTranslatedPath(self, path, nil, p).success_or_raise
    end

    def add_path(path : Path, range : Range(Int32, Int32), p : Point) : Bool
      LibBlend2D.blPathAddTranslatedPath(self, path, BLRange.new(range), p).success_or_raise
    end

    def add_path(path : Path, transform : Matrix2D) : Bool
      LibBlend2D.blPathAddTransformedPath(self, path, nil, transform).success_or_raise
    end

    def add_path(path : Path, range : Range(Int32, Int32), transform : Matrix2D) : Bool
      LibBlend2D.blPathAddTransformedPath(self, path, BLRange.new(range), transform).success_or_raise
    end

    def add_reversed_path(path : Path, reverse_mode : PathReverseMode)
      LibBlend2D.blPathAddReversedPath(self, path, nil, reverse_mode).success_or_raise
    end

    def add_reversed_path(path : Path, range : Range(Int32, Int32), reverse_mode : PathReverseMode)
      LibBlend2D.blPathAddReversedPath(self, path, BLRange.new(range), reverse_mode).success_or_raise
    end

    def add_stroked_path(other : Path) : Bool
      LibBlend2D.blPathAddStrokedPath(self, other, nil, nil, nil).success_or_raise
    end

    def add_stroked_path(other : Path, range : Range(Int32, Int32)) : Bool
      LibBlend2D.blPathAddStrokedPath(self, other, BLRange.new(range), nil, nil).success_or_raise
    end

    def add_stroked_path(other : Path, range : Range(Int32, Int32), options : StrokeOptions? = nil, approx : ApproximationOptions? = nil) : Bool
      LibBlend2D.blPathAddStrokedPath(self, other, BLRange.new(range), options, approx).success_or_raise
    end

    def translate(p : Point) : Bool
      LibBlend2D.blPathTranslate(self, nil, p).success_or_raise
    end

    def translate(range : Range(Int32, Int32), p : Point) : Bool
      LibBlend2D.blPathTranslate(self, BLRange.new(range), p).success_or_raise
    end

    def transform(m : Matrix2D) : Bool
      LibBlend2D.blPathTransform(self, nil, m).success_or_raise
    end

    def transform(range : Range(Int32, Int32), m : Matrix2D) : Bool
      LibBlend2D.blPathTransform(self, nil, m).success_or_raise
    end
  end
end
