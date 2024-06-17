module Blend2D
  class Context < Core(LibBlend2D::BLContextCore)
    def initialize(image : Image)
      LibBlend2D.blContextInitAs(out @core, image, nil).success_or_raise
    end

    def finalize
      LibBlend2D.blContextDestroy(self).success_or_raise
    end

    def type : ContextType
      LibBlend2D.blContextGetType(self)
    end

    def target_size : Size
      LibBlend2D.blContextGetTargetSize(self, out target_size).success_or_raise
      Size.new target_size
    end

    def begin(image : Image) : Bool
      LibBlend2D.blContextBegin(self, image, nil).success_or_raise
    end

    def end : Bool
      LibBlend2D.blContextEnd(self).success_or_raise
    end

    def save : ContextCookie
      LibBlend2D.blContextSave(self, out cookie).success_or_raise
      ContextCookie.new cookie
    end

    def restore : Bool
      LibBlend2D.blContextRestore(self, nil).success_or_raise
    end

    def restore(cookie : ContextCookie) : Bool
      LibBlend2D.blContextRestore(self, cookie).success_or_raise
    end

    def save_and_restore
      cookie = uninitialized LibBlend2D::BLContextCookie
      LibBlend2D.blContextSave(self, pointerof(cookie)).success_or_raise
      yield
      LibBlend2D.blContextRestore(self, pointerof(cookie)).success_or_raise
    end

    def meta_transform : Matrix2D
      LibBlend2D.blContextGetMetaTransform(self, out transform).success_or_raise
      Matrix2D.new transform
    end

    def user_transform : Matrix2D
      LibBlend2D.blContextGetUserTransform(self, out transform).success_or_raise
      Matrix2D.new transform
    end

    def final_transform : Matrix2D
      LibBlend2D.blContextGetFinalTransform(self, out transform).success_or_raise
      Matrix2D.new transform
    end

    def user_to_meta : Bool
      LibBlend2D.blContextUserToMeta(self).success_or_raise
    end

    def apply_transform_op(op : TransformOp, data : Array(Float64)) : Bool
      LibBlend2D.blContextApplyTransformOp(self, op, data).success_or_raise
    end

    def translate(x : Float64, y : Float64) : Bool
      apply_transform_op :translate, [x, y]
    end

    def post_translate(x : Float64, y : Float64) : Bool
      apply_transform_op :post_translate, [x, y]
    end

    def rotate(angle : Float64) : Bool
      apply_transform_op :rotate, [angle]
    end

    def post_rotate(angle : Float64) : Bool
      apply_transform_op :post_rotate, [angle]
    end

    def rotate(angle : Float64, x : Float64, y : Float64) : Bool
      apply_transform_op :rotate_pt, [angle, x, y]
    end

    def post_rotate(angle : Float64, x : Float64, y : Float64) : Bool
      apply_transform_op :post_rotate_pt, [angle, x, y]
    end

    def scale(x : Float64, y : Float64) : Bool
      apply_transform_op :scale, [x, y]
    end

    def post_scale(x : Float64, y : Float64) : Bool
      apply_transform_op :post_scale, [x, y]
    end

    def skew(x : Float64, y : Float64) : Bool
      apply_transform_op :skew, [x, y]
    end

    def post_skew(x : Float64, y : Float64) : Bool
      apply_transform_op :post_skew, [x, y]
    end

    def transform(matrix : Matrix2D) : Bool
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::Transform, matrix).success_or_raise
    end

    def post_transform(matrix : Matrix2D) : Bool
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::PostTransform, matrix).success_or_raise
    end

    def transform=(matrix : Matrix2D)
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::Assign, matrix).success_or_raise
    end

    def reset_transform()
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::Reset, nil).success_or_raise
    end

    def hint(hint_type : ContextHint) : UInt32
      LibBlend2D.blContextGetHint(self, hint_type)
    end

    def set_hint(hint_type : ContextHint, value : UInt32) : Bool
      LibBlend2D.blContextSetHint(self, hint_type, value).success_or_raise
    end

    def rendering_quality : RenderingQuality
      RenderingQuality.new hint(:rendering_quality)
    end

    def rendering_quality=(rendering_quality : RenderingQuality)
      set_hint :rendering_quality, rendering_quality.value
    end

    def gradient_quality : GradientQuality
      GradientQuality.new hint(:gradient_quality)
    end

    def gradient_quality=(gradient_quality : GradientQuality)
      set_hint :gradient_quality, gradient_quality.value
    end

    def pattern_quality : PatternQuality
      PatternQuality.new hint(:pattern_quality)
    end

    def pattern_quality=(pattern_quality : PatternQuality)
      set_hint :pattern_quality, pattern_quality.value
    end

    def hints : ContextHints
      LibBlend2D.blContextGetHints(self, out hints).success_or_raise
      ContextHints.new hints
    end

    def hints=(hints : ContextHints)
      LibBlend2D.blContextSetHints(self, hints).success_or_raise
    end

    def flatten_mode=(mode : FlattenMode)
      LibBlend2D.blContextSetFlattenMode(self, mode).success_or_raise
    end

    def flatten_tolerance=(tolerance : Float64)
      LibBlend2D.blContextSetFlattenTolerance(self, tolerance).success_or_raise
    end

    def fill_style
      LibBlend2D.blContextGetFillStyle(self, out style).success_or_raise
      Var.init_with_type style
    end

    def transformed_fill_style
      LibBlend2D.blContextGetTransformedFillStyle(self, out style).success_or_raise
      Var.init_with_type style
    end

    def fill_style=(rgba32 : UInt32)
      LibBlend2D.blContextSetFillStyleRgba32(self, rgba32).success_or_raise
    end

    def fill_style=(rgba : RGBA)
      LibBlend2D.blContextSetFillStyleRgba(self, rgba).success_or_raise
    end

    def fill_style=(rgba32 : RGBA32)
      LibBlend2D.blContextSetFillStyleRgba32(self, rgba32.packed).success_or_raise
    end

    def fill_style=(rgba32 : UInt32)
      LibBlend2D.blContextSetFillStyleRgba32(self, rgba32).success_or_raise
    end

    def fill_style=(rgba64 : RGBA64)
      LibBlend2D.blContextSetFillStyleRgba64(self, rgba64.packed).success_or_raise
    end

    def fill_style=(rgba64 : UInt64)
      LibBlend2D.blContextSetFillStyleRgba64(self, rgba64).success_or_raise
    end

    def fill_style=(style)
      LibBlend2D.blContextSetFillStyle(self, style).success_or_raise
    end

    def fill_alpha : Float64
      LibBlend2D.blContextGetFillAlpha(self)
    end

    def fill_alpha=(alpha : Float64)
      LibBlend2D.blContextSetFillAlpha(self, alpha).success_or_raise
    end

    def disable_fill_style : Bool
      LibBlend2D.blContextDisableFillStyle(self).success_or_raise
    end

    def stroke_style
      LibBlend2D.blContextGetStrokeStyle(self, out style).success_or_raise
      Var.init_with_type style
    end

    def transformed_stroke_style
      LibBlend2D.blContextGetTransformedStrokeStyle(self, out style).success_or_raise
      Var.init_with_type style
    end

    def stroke_style=(rgba : RGBA)
      LibBlend2D.blContextSetStrokeStyleRgba(self, rgba).success_or_raise
    end

    def stroke_style=(rgba32 : UInt32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32).success_or_raise
    end

    def stroke_style=(rgba32 : RGBA32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32.packed).success_or_raise
    end

    def stroke_style=(rgba64 : UInt64)
      LibBlend2D.blContextSetStrokeStyleRgba64(self, rgba64).success_or_raise
    end

    def stroke_style=(rgba64 : RGBA64)
      LibBlend2D.blContextSetStrokeStyleRgba64(self, rgba64.packed).success_or_raise
    end

    def stroke_style=(style)
      LibBlend2D.blContextSetStrokeStyle(self, style).success_or_raise
    end

    def stroke_alpha : Float64
      LibBlend2D.blContextGetStrokeAlpha(self)
    end

    def stroke_alpha=(alpha : Float64)
      LibBlend2D.blContextSetStrokeAlpha(self, alpha).success_or_raise
    end

    def disable_stroke_style : Bool
      LibBlend2D.blContextDisableStrokeStyle(self).success_or_raise
    end

    def swap_styles(mode : ContextStyleSwapMode = ContextStyleSwapMode::Styles) : Bool
      LibBlend2D.blContextSwapStyles(self, mode).success_or_raise
    end

    def swap_styles_with_alpha()
      swap_styles :styles_with_alpha
    end

    def global_alpha : Float64
      LibBlend2D.blContextGetGlobalAlpha(self)
    end

    def global_alpha=(alpha : Float64)
      LibBlend2D.blContextSetGlobalAlpha(self, alpha).success_or_raise
    end

    def comp_op : CompOp
      LibBlend2D.blContextGetCompOp(self)
    end

    def comp_op=(comp_op : CompOp)
      LibBlend2D.blContextSetCompOp(self, comp_op).success_or_raise
    end

    def fill_rule : FillRule
      LibBlend2D.blContextGetFillRule(self)
    end

    def fill_rule=(fill_rule : FillRule)
      LibBlend2D.blContextSetFillRule(self, fillRule).success_or_raise
    end

    def stroke_width : Float64
      LibBlend2D.blContextGetStrokeWidth(self)
    end

    def stroke_width=(width : Float64)
      LibBlend2D.blContextSetStrokeWidth(self, width).success_or_raise
    end

    def stroke_miter_limit : Float64
      LibBlend2D.blContextGetStrokeMiterLimit(self)
    end

    def stroke_miter_limit=(miter_limit : Float64)
      LibBlend2D.blContextSetStrokeMiterLimit(self, miter_limit).success_or_raise
    end


    def stroke_style_rgba32=(rgba32 : UInt32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32).success_or_raise
    end

    def stroke_cap(position : StrokeCapPosition) : StrokeCap
      LibBlend2D.blContextGetStrokeCap(self, position)
    end

    def stroke_start_cap : StrokeCap
      stroke_cap :start
    end

    def stroke_end_cap : StrokeCap
      stroke_cap :end
    end

    def stroke_caps=(stroke_cap : StrokeCap)
      LibBlend2D.blContextSetStrokeCaps(self, stroke_cap).success_or_raise
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

    def stroke_join : StrokeJoin
      LibBlend2D.blContextGetStrokeJoin(self)
    end

    def stroke_join=(stroke_join : StrokeJoin)
      LibBlend2D.blContextSetStrokeJoin(self, stroke_join).success_or_raise
    end

    def stroke_transform_order : StrokeTransformOrder
      LibBlend2D.blContextGetStrokeTransformOrder(self)
    end

    def stroke_transform_order=(transform_order : StrokeTransformOrder)
      LibBlend2D.blContextSetStrokeTransformOrder(self, transform_order).success_or_raise
    end

    def stroke_options : StrokeOptions
      LibBlend2D.blContextGetStrokeOptions(self, out options).success_or_raise
      StrokeOptions.new options
    end

    def stroke_options=(options : StrokeOptions)
      LibBlend2D.blContextSetStrokeOptions(self, options).success_or_raise
    end

    def clip_to_rect(rect : Rect) : Bool
      LibBlend2D.blContextClipToRectD(self, rect).success_or_raise
    end

    def clip_to_rect(rect : RectI) : Bool
      LibBlend2D.blContextClipToRectI(self, rect).success_or_raise
    end

    def clip_to_rect(x : Float64, y : Float64, w : Float64, h : Float64) : Bool
      rect = Rect.new x, y, w, h
      LibBlend2D.blContextClipToRectI(self, rect).success_or_raise
    end

    def restore_clipping : Bool
      LibBlend2D.blContextRestoreClipping(self).success_or_raise
    end

    def clear_all : Bool
      LibBlend2D.blContextClearAll(self).success_or_raise
    end

    def clear_rect(rect : RectI) : Bool
      LibBlend2D.blContextClearRectI(self, rect).success_or_raise
    end

    def clear_rect(rect : Rect) : Bool
      LibBlend2D.blContextClearRectD(self, rect).success_or_raise
    end

    def clear_rect(x : Float64, y : Float64, w : Float64, h : Float64) : Bool
      rect = Rect.new x, y, w, h
      LibBlend2D.blContextClearRectD(self, rect).success_or_raise
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

    def fill_all(rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillAllRgba64(self, rgba64).success_or_raise
    end

    def fill_all(rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillAllRgba64(self, rgba64.packed).success_or_raise
    end

    def fill_all(style) : Bool
      LibBlend2D.blContextFillAllExt(self, style).success_or_raise
    end

    def fill(rect : RectI) : Bool
      LibBlend2D.blContextFillRectI(self, rect).success_or_raise
    end

    def fill(rect : Rect) : Bool
      LibBlend2D.blContextFillRectD(self, rect).success_or_raise
    end

    def fill(rect : RectI, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillRectIRgba32(self, rect, rgba32.packed).success_or_raise
    end

    def fill(rect : Rect, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillRectDRgba32(self, rect, rgba32.packed).success_or_raise
    end

    def fill(rect : RectI, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillRectIRgba32(self, rect, rgba32).success_or_raise
    end

    def fill(rect : Rect, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillRectDRgba32(self, rect, rgba32).success_or_raise
    end

    def fill(rect : RectI, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillRectIRgba64(self, rect, rgba64.packed).success_or_raise
    end

    def fill(rect : Rect, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillRectDRgba64(self, rect, rgba64.packed).success_or_raise
    end

    def fill(rect : RectI, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillRectIRgba64(self, rect, rgba64).success_or_raise
    end

    def fill(rect : Rect, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillRectDRgba64(self, rect, rgba64).success_or_raise
    end

    def fill(rect : RectI, style) : Bool
      LibBlend2D.blContextFillRectIExt(self, rect, style).success_or_raise
    end

    def fill(rect : Rect, style) : Bool
      LibBlend2D.blContextFillRectDExt(self, rect, style).success_or_raise
    end

    def fill(path : Path) : Bool
      fill Point::ZERO, path
    end

    def fill(origin : Point, path : Path) : Bool
      LibBlend2D.blContextFillPathD(self, origin, path).success_or_raise
    end

    def fill(path : Path, rgba32 : RGBA32) : Bool
      fill Point::ZERO, path, rgba32
    end

    def fill(origin : Point, path : Path, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillPathDRgba32(self, origin, path, rgba32.packed).success_or_raise
    end

    def fill(path : Path, rgba32 : UInt32) : Bool
      fill Point::ZERO, path, rgba32
    end

    def fill(origin : Point, path : Path, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillPathDRgba32(self, origin, path, rgba32).success_or_raise
    end

    def fill(path : Path, rgba64 : RGBA64) : Bool
      fill Point::ZERO, path, rgba64
    end

    def fill(origin : Point, path : Path, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillPathDRgba64(self, origin, path, rgba64.packed).success_or_raise
    end

    def fill(path : Path, rgba64 : UInt64) : Bool
      fill Point::ZERO, path, rgba64
    end

    def fill(origin : Point, path : Path, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillPathDRgba64(self, origin, path, rgba64).success_or_raise
    end

    def fill(path : Path, style) : Bool
      fill Point::ZERO, path, style
    end

    def fill(origin : Point, path : Path, style) : Bool
      LibBlend2D.blContextFillPathDExt(self, origin, path, style).success_or_raise
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

    def fill(geometry : Geometry::Core, rgba64 : UInt64)
      LibBlend2D.blContextFillGeometryRgba64(
        self,
        geometry.type,
        geometry,
        rgba64,
      ).success_or_raise
    end

    def fill(geometry : Geometry::Core, rgba64 : RGBA64)
      LibBlend2D.blContextFillGeometryRgba64(
        self,
        geometry.type,
        geometry,
        rgba64.packed,
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

    def fill(origin : PointI , font : Font, text : String)
      LibBlend2D.blContextFillUtf8TextI(self, origin, font, text, text.size).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillUtf8TextDRgba32(self, origin, font, text, text.size, rgba32.packed).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf8TextDRgba32(self, origin, font, text, text.size, rgba32).success_or_raise
    end

    def fill(origin : PointI, font : Font, text : String, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillUtf8TextIRgba32(self, origin, font, text, text.size, rgba32.packed).success_or_raise
    end

    def fill(origin : PointI, font : Font, text : String, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf8TextIRgba32(self, origin, font, text, text.size, rgba32).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillUtf8TextDRgba64(self, origin, font, text, text.size, rgba64.packed).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillUtf8TextDRgba64(self, origin, font, text, text.size, rgba64).success_or_raise
    end

    def fill(origin : PointI, font : Font, text : String, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillUtf8TextIRgba64(self, origin, font, text, text.size, rgba64.packed).success_or_raise
    end

    def fill(origin : PointI, font : Font, text : String, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillUtf8TextIRgba64(self, origin, font, text, text.size, rgba64).success_or_raise
    end

    def fill(origin : Point, font : Font, text : String, style) : Bool
      LibBlend2D.blContextFillUtf8TextDExt(self, origin, font, text, text.size, style).success_or_raise
    end

    def fill(origin : PointO, font : Font, text : String, style) : Bool
      LibBlend2D.blContextFillUtf8TextIExt(self, origin, font, text, text.size, style).success_or_raise
    end

    def fill(origin : Point, font : Font, glyphRun : GlyphRun) : Bool
      LibBlend2D.blContextFillGlyphRunD(self, origin, font, glyphRun).success_or_raise
    end

    def fill(origin : PointI, font : Font, glyphRun : GlyphRun) : Bool
      LibBlend2D.blContextFillGlyphRunI(self, origin, font, glyphRun).success_or_raise
    end

    def fill(origin : Point, font : Font, glyph_run : GlyphRun, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillGlyphRunDRgba32(self, origin, font, glyph_run, rgba32).success_or_raise
    end

    def fill(origin : Point, font : Font, glyph_run : GlyphRun, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillGlyphRunDRgba32(self, origin, font, glyph_run, rgba32.packed).success_or_raise
    end

    def fill(origin : PointI, font : Font, glyph_run : GlyphRun, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillGlyphRunIRgba32(self, origin, font, glyph_run, rgba32).success_or_raise
    end

    def fill(origin : PointI, font : Font, glyph_run : GlyphRun, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextFillGlyphRunIRgba32(self, origin, font, glyph_run, rgba32.packed).success_or_raise
    end

    def fill(origin : Point, font : Font, glyph_run : GlyphRun, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillGlyphRunDRgba64(self, origin, font, glyph_run, rgba64).success_or_raise
    end

    def fill(origin : Point, font : Font, glyph_run : GlyphRun, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillGlyphRunDRgba64(self, origin, font, glyph_run, rgba64.packed).success_or_raise
    end

    def fill(origin : PointI, font : Font, glyph_run : GlyphRun, rgba64 : UInt64) : Bool
      LibBlend2D.blContextFillGlyphRunIRgba64(self, origin, font, glyph_run, rgba64).success_or_raise
    end

    def fill(origin : PointI, font : Font, glyph_run : GlyphRun, rgba64 : RGBA64) : Bool
      LibBlend2D.blContextFillGlyphRunIRgba64(self, origin, font, glyph_run, rgba64.packed).success_or_raise
    end

    def fill(origin : Point, font : Font, glyph_run : GlyphRun, style) : Bool
      LibBlend2D.blContextFillGlyphRunDExt(self, origin, font, glyph_run, style).success_or_raise
    end

    def fill(origin : PointI, font : Font, glyph_run : GlyphRun, style) : Bool
      LibBlend2D.blContextFillGlyphRunIExt(self, origin, font, glyph_run, style).success_or_raise
    end

    def fill(origin : Point, mask : Image, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskD(self, origin, mask, mask_area).success_or_raise
    end

    def fill(origin : PointI, mask : Image, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskI(self, origin, mask, mask_area).success_or_raise
    end

    def fill(origin : Point, mask : Image, rgba32 : RGBA32, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskDRgba32(self, origin, mask, mask_area, rgba32.packed).success_or_raise
    end

    def fill(origin : PointI, mask : Image, rgba32 : RGBA32, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskIRgba32(self, origin, mask, mask_area, rgba32.packed).success_or_raise
    end

    def fill(origin : Point, mask : Image, rgba32 : UInt32, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskDRgba32(self, origin, mask, mask_area, rgba32).success_or_raise
    end

    def fill(origin : PointI, mask : Image, rgba32 : UInt32, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskIRgba32(self, origin, mask, mask_area, rgba32).success_or_raise
    end

    def fill(origin : Point, mask : Image, rgba64 : RGBA64, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskDRgba64(self, origin, mask, mask_area, rgba64.packed).success_or_raise
    end

    def fill(origin : PointI, mask : Image, rgba64 : RGBA64, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskIRgba64(self, origin, mask, mask_area, rgba64.packed).success_or_raise
    end

    def fill(origin : Point, mask : Image, rgba64 : UInt64, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskDRgba64(self, origin, mask, mask_area, rgba64).success_or_raise
    end

    def fill(origin : PointI, mask : Image, rgba64 : UInt64, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskIRgba64(self, origin, mask, mask_area, rgba64).success_or_raise
    end

    def fill(origin : Point, mask : Image, style, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskDExt(self, origin, mask, mask_area, style).success_or_raise
    end

    def fill(origin : PointI, mask : Image, style, mask_area : RectI? = Nil) : Bool
      LibBlend2D.blContextFillMaskIExt(self, origin, mask, mask_area, style).success_or_raise
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

    def stroke(geometry : Geometry::Core) : Bool
      LibBlend2D.blContextStrokeGeometry(
        self,
        geometry.type,
        geometry,
      ).success_or_raise
    end

    def stroke(geometry : Geometry::Core, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGeometryRgba32(
        self,
        geometry.type,
        geometry,
        rgba32,
      ).success_or_raise
    end

    def stroke(geometry : Geometry::Core, rgba32 : RGBA32) : Bool
      LibBlend2D.blContextStrokeGeometryRgba32(
        self,
        geometry.type,
        geometry,
        rgba32.packed,
      ).success_or_raise
    end

    def stroke(geometry : Geometry::Core, style) : Bool
      LibBlend2D.blContextStrokeGeometryExt(
        self,
        geometry.type,
        geometry,
        style,
      ).success_or_raise
    end

    def stroke(origin : Point , font : Font, text : String) : Bool
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
