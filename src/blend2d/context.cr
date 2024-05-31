module Blend2D
  class Context < Core(LibBlend2D::BLContextCore)
    def initialize(image : Image)
      LibBlend2D.blContextInitAs(out @core, image, nil).success_or_raise
    end

    def finalize
      LibBlend2D.blContextDestroy(self).success_or_raise
    end

    def end : Bool
      LibBlend2D.blContextEnd(self).success_or_raise
    end

    def apply_transform_op(op : TransformOp, data : Array(Float64)) : Bool
      LibBlend2D.blContextApplyTransformOp(self, op, data).success_or_raise
    end

    def rotate(angle : Float64)
      apply_transform_op :rotate, [angle]
    end

    def rotate(angle : Float64, x : Float64, y : Float64)
      apply_transform_op :rotate_pt, [angle, x, y]
    end

    def fill_style=(style)
      LibBlend2D.blContextSetFillStyle(self, style).success_or_raise
    end

    def fill_style=(rgba32 : UInt32)
      LibBlend2D.blContextSetFillStyleRgba32(self, rgba32).success_or_raise
    end

    def comp_op : CompOp
      LibBlend2D.blContextGetCompOp(self)
    end

    def comp_op=(comp_op : CompOp)
      LibBlend2D.blContextSetCompOp(self, comp_op).success_or_raise
    end

    def set_stroke_cap(position : StrokeCapPosition, stroke_cap : StrokeCap) : Bool
      LibBlend2D.blContextSetStrokeCap(self, position, stroke_cap).success_or_raise
    end

    def stroke_start_cap=(stroke_cap : StrokeCap)
      set_stroke_cap :start, stroke_cap
    end

    def stroke_end_cap=(stroke_cap : StrokeCap)
      set_stroke_cap :end, stroke_cap
    end

    def fill_all : Bool
      LibBlend2D.blContextFillAll(self).success_or_raise
    end

    def fill_all(rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillAllRgba32(self, rgba32).success_or_raise
    end

    def fill(path : Path) : Bool
      fill Point::ZERO, path
    end

    def fill(origin : Point, path : Path) : Bool
      LibBlend2D.blContextFillPathD(self, origin, path).success_or_raise
    end

    def fill(geometry : Geometry::Core, style)
      LibBlend2D.blContextFillGeometryExt(
        self,
        geometry.type,
        geometry,
        style,
      ).success_or_raise
    end

    def fill(origin : Point , font : Font, text : String)
      LibBlend2D.blContextFillUtf8TextD(self, origin, font, text, text.size).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf8TextDRgba32(self, origin, font, text, text.size, rgba32).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, style) : Bool
      LibBlend2D.blContextFillUtf8TextDExt(self, origin, font, text, text.size, style).success_or_raise
    end

    def fill(origin : Point, font : Font, glyph_run : GlyphRun, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillGlyphRunDRgba32(self, origin, font, glyph_run, rgba32).success_or_raise
    end

    def stroke_width : Float64
      LibBlend2D.blContextGetStrokeWidth(self)
    end

    def stroke_width=(width : Float64)
      LibBlend2D.blContextSetStrokeWidth(self, width).success_or_raise
    end

    def stroke(path : Path) : Bool
      stroke Point::ZERO, path
    end

    def stroke(path : Path, style) : Bool
      stroke Point::ZERO, path, style
    end

    def stroke(origin : Point, path : Path) : Bool
      LibBlend2D.blContextStrokePathD(self, origin, path).success_or_raise
    end

    def stroke(origin : Point, path : Path, style) : Bool
      LibBlend2D.blContextStrokePathDExt(self, origin, path, style).success_or_raise
    end
  end
end
