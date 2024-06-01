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

    def save : Bool
      LibBlend2D.blContextSave(self, nil).success_or_raise
    end

    def restore : Bool
      LibBlend2D.blContextRestore(self, nil).success_or_raise
    end

    def save_and_restore
      cookie = uninitialized LibBlend2D::BLContextCookie
      LibBlend2D.blContextSave(self, pointerof(cookie)).success_or_raise
      yield
      LibBlend2D.blContextRestore(self, pointerof(cookie)).success_or_raise
    end

    def apply_transform_op(op : TransformOp, data : Array(Float64)) : Bool
      LibBlend2D.blContextApplyTransformOp(self, op, data).success_or_raise
    end

    def translate(x : Float64, y : Float64)
      apply_transform_op :translate, [x, y]
    end

    def rotate(angle : Float64)
      apply_transform_op :rotate, [angle]
    end

    def rotate(angle : Float64, x : Float64, y : Float64)
      apply_transform_op :rotate_pt, [angle, x, y]
    end

    def scale(x : Float64, y : Float64)
      apply_transform_op :scale, [x, y]
    end

    def skew(x : Float64, y : Float64)
      apply_transform_op :skew, [x, y]
    end

    def fill_style=(style)
      LibBlend2D.blContextSetFillStyle(self, style).success_or_raise
    end

    def fill_style=(rgba32 : UInt32)
      LibBlend2D.blContextSetFillStyleRgba32(self, rgba32).success_or_raise
    end

    def fill_style=(rgba32 : RGBA32)
      LibBlend2D.blContextSetFillStyleRgba32(self, rgba32.packed).success_or_raise
    end

    def stroke_style=(rgba32 : UInt32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32).success_or_raise
    end

    def stroke_style=(rgba32 : RGBA32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32.packed).success_or_raise
    end

    def comp_op : CompOp
      LibBlend2D.blContextGetCompOp(self)
    end

    def comp_op=(comp_op : CompOp)
      LibBlend2D.blContextSetCompOp(self, comp_op).success_or_raise
    end
    def stroke_style_rgba32=(rgba32 : UInt32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32).success_or_raise
    end

    def stroke_cap(position : StrokeCapPosition) : StrokeCap
      LibBlend2D.blContextGetStrokeCap(self, position)
    end

    def stroke_start_cap
      stroke_cap :start
    end

    def stroke_end_cap
      stroke_cap :end
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

    def fill_all(rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillAllRgba32(self, rgba32.packed).success_or_raise
    end

    def fill(path : Path) : Bool
      fill Point::ZERO, path
    end

    def fill(origin : Point, path : Path) : Bool
      LibBlend2D.blContextFillPathD(self, origin, path).success_or_raise
    end

    def fill(geometry : Geometry::Core)
      LibBlend2D.blContextFillGeometry(
        self,
        geometry.type,
        geometry.to_unsafe,
      ).success_or_raise
    end

    def fill(geometry : Geometry::Core, rgba32 : UInt32)
      LibBlend2D.blContextFillGeometryRgba32(
        self,
        geometry.type,
        geometry,
        rgba32,
      ).success_or_raise
    end

    def fill(geometry : Geometry::Core, rgba32 : RGBA32)
      LibBlend2D.blContextFillGeometryRgba32(
        self,
        geometry.type,
        geometry,
        rgba32.packed,
      ).success_or_raise
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

    def fill(origin : Point, font : Font, glyphRun : GlyphRun) : Bool
      LibBlend2D.blContextFillGlyphRunD(self, origin, font, glyphRun).success_or_raise
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

    def stroke(geometry : Geometry::Core)
      LibBlend2D.blContextStrokeGeometry(
        self,
        geometry.type,
        geometry,
      ).success_or_raise
    end

    def stroke(geometry : Geometry::Core, rgba32 : UInt32)
      LibBlend2D.blContextStrokeGeometryRgba32(
        self,
        geometry.type,
        geometry,
        rgba32,
      ).success_or_raise
    end

    def stroke(geometry : Geometry::Core, rgba32 : RGBA32)
      LibBlend2D.blContextStrokeGeometryRgba32(
        self,
        geometry.type,
        geometry,
        rgba32.packed,
      ).success_or_raise
    end

    def stroke(geometry : Geometry::Core, style)
      LibBlend2D.blContextStrokeGeometryExt(
        self,
        geometry.type,
        geometry,
        style,
      ).success_or_raise
    end

    def stroke(origin : Point , font : Font, text : String)
      LibBlend2D.blContextStrokeUtf8TextD(self, origin, font, text, text.size).success_or_raise
    end

    def stroke(origin : Point, font : Font, text : String, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf8TextDRgba32(self, origin, font, text, text.size, rgba32).success_or_raise
    end

    def stroke(origin : Point, font : Font, text : String, style) : Bool
      LibBlend2D.blContextStrokeUtf8TextDExt(self, origin, font, text, text.size, style).success_or_raise
    end

    def stroke(origin : Point, font : Font, glyph_run : GlyphRun, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGlyphRunDRgba32(self, origin, font, glyph_run, rgba32).success_or_raise
    end

    def blit_image(origin : PointI, img : Image, img_area : RectI? = nil) : Bool
      LibBlend2D.blContextBlitImageI(self, origin, img, img_area).success_or_raise
    end
  end
end
