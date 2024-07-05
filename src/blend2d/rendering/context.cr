module Blend2D::Rendering
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

    def begin(image : Image)
      LibBlend2D.blContextBegin(self, image, nil).success_or_raise
    end

    def end
      LibBlend2D.blContextEnd(self).success_or_raise
    end

    def save : ContextCookie
      LibBlend2D.blContextSave(self, out cookie).success_or_raise
      ContextCookie.new cookie
    end

    def restore
      LibBlend2D.blContextRestore(self, nil).success_or_raise
    end

    def restore(cookie : ContextCookie)
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

    def user_to_meta
      LibBlend2D.blContextUserToMeta(self).success_or_raise
    end

    def apply_transform_op(op : TransformOp, data : Array(Float64))
      LibBlend2D.blContextApplyTransformOp(self, op, data).success_or_raise
    end

    def translate(x : Float64, y : Float64)
      apply_transform_op :translate, [x, y]
    end

    def post_translate(x : Float64, y : Float64)
      apply_transform_op :post_translate, [x, y]
    end

    def rotate(angle : Float64)
      apply_transform_op :rotate, [angle]
    end

    def post_rotate(angle : Float64)
      apply_transform_op :post_rotate, [angle]
    end

    def rotate(angle : Float64, x : Float64, y : Float64)
      apply_transform_op :rotate_pt, [angle, x, y]
    end

    def post_rotate(angle : Float64, x : Float64, y : Float64)
      apply_transform_op :post_rotate_pt, [angle, x, y]
    end

    def scale(x : Float64, y : Float64)
      apply_transform_op :scale, [x, y]
    end

    def post_scale(x : Float64, y : Float64)
      apply_transform_op :post_scale, [x, y]
    end

    def skew(x : Float64, y : Float64)
      apply_transform_op :skew, [x, y]
    end

    def post_skew(x : Float64, y : Float64)
      apply_transform_op :post_skew, [x, y]
    end

    def transform(matrix : Matrix2D)
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::Transform, matrix).success_or_raise
    end

    def post_transform(matrix : Matrix2D)
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::PostTransform, matrix).success_or_raise
    end

    def transform=(matrix : Matrix2D)
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::Assign, matrix).success_or_raise
    end

    def reset_transform
      LibBlend2D.blContextApplyTransformOp(self, TransformOp::Reset, nil).success_or_raise
    end

    def hint(hint_type : ContextHint) : UInt32
      LibBlend2D.blContextGetHint(self, hint_type)
    end

    def set_hint(hint_type : ContextHint, value : UInt32)
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

    def fill_style=(style : Style)
      case style
      when UInt32
        LibBlend2D.blContextSetFillStyleRgba32(self, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextSetFillStyleRgba32(self, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextSetFillStyleRgba64(self, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextSetFillStyleRgba64(self, style.packed).success_or_raise
      else
        LibBlend2D.blContextSetFillStyle(self, style).success_or_raise
      end
    end

    def fill_alpha : Float64
      LibBlend2D.blContextGetFillAlpha(self)
    end

    def fill_alpha=(alpha : Float64)
      LibBlend2D.blContextSetFillAlpha(self, alpha).success_or_raise
    end

    def disable_fill_style
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

    def stroke_style=(style : Style | RGBA)
      case style
      when RGBA
        LibBlend2D.blContextSetStrokeStyleRgba(self, style).success_or_raise
      when UInt32
        LibBlend2D.blContextSetStrokeStyleRgba32(self, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextSetStrokeStyleRgba32(self, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextSetStrokeStyleRgba64(self, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextSetStrokeStyleRgba64(self, style.packed).success_or_raise
      else
        LibBlend2D.blContextSetStrokeStyle(self, style).success_or_raise
      end
    end

    def stroke_alpha : Float64
      LibBlend2D.blContextGetStrokeAlpha(self)
    end

    def stroke_alpha=(alpha : Float64)
      LibBlend2D.blContextSetStrokeAlpha(self, alpha).success_or_raise
    end

    def disable_stroke_style
      LibBlend2D.blContextDisableStrokeStyle(self).success_or_raise
    end

    def swap_styles(mode : ContextStyleSwapMode = ContextStyleSwapMode::Styles)
      LibBlend2D.blContextSwapStyles(self, mode).success_or_raise
    end

    def swap_styles_with_alpha
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

    def set_stroke_cap(position : StrokeCapPosition, stroke_cap : StrokeCap)
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

    def clip_to_rect(rect : Rect | RectI)
      case rect
      in Rect
        LibBlend2D.blContextClipToRectD(self, rect).success_or_raise
      in RectI
        LibBlend2D.blContextClipToRectI(self, rect).success_or_raise
      end
    end

    def clip_to_rect(x : Float64, y : Float64, w : Float64, h : Float64)
      rect = Rect.new x, y, w, h
      LibBlend2D.blContextClipToRectD(self, rect).success_or_raise
    end

    def restore_clipping
      LibBlend2D.blContextRestoreClipping(self).success_or_raise
    end

    def clear_all
      LibBlend2D.blContextClearAll(self).success_or_raise
    end

    def clear_rect(rect : Rect | RectI)
      case rect
      in Rect
        LibBlend2D.blContextClearRectD(self, rect).success_or_raise
      in RectI
        LibBlend2D.blContextClearRectI(self, rect).success_or_raise
      end
    end

    def clear_rect(x : Float64, y : Float64, w : Float64, h : Float64)
      rect = Rect.new x, y, w, h
      LibBlend2D.blContextClearRectD(self, rect).success_or_raise
    end

    def fill_all(style : Style? = nil)
      case style
      when Nil
        LibBlend2D.blContextFillAll(self).success_or_raise
      when UInt32
        LibBlend2D.blContextFillAllRgba32(self, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextFillAllRgba32(self, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextFillAllRgba64(self, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextFillAllRgba64(self, style.packed).success_or_raise
      else
        LibBlend2D.blContextFillAllExt(self, style).success_or_raise
      end
    end

    def fill_rect(x : Float64, y : Float64, w : Float64, h : Float64, style : Style? = nil)
      rect = Rect.new x, y, w, h
      fill_rect rect, style
    end

    def fill_rect(rect : Rect | RectI, style : Style? = nil)
      case rect
      in Rect
        case style
        when Nil
          LibBlend2D.blContextFillRectD(self, rect).success_or_raise
        when UInt32
          LibBlend2D.blContextFillRectDRgba32(self, rect, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillRectDRgba32(self, rect, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillRectDRgba64(self, rect, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillRectDRgba64(self, rect, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillRectDExt(self, rect, style).success_or_raise
        end
      in RectI
        case style
        when Nil
          LibBlend2D.blContextFillRectI(self, rect).success_or_raise
        when UInt32
          LibBlend2D.blContextFillRectIRgba32(self, rect, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillRectIRgba32(self, rect, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillRectIRgba64(self, rect, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillRectIRgba64(self, rect, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillRectIExt(self, rect, style).success_or_raise
        end
      end
    end

    def fill_path(path : Path, style : Style? = nil)
      fill_path Point::ZERO, path, style
    end

    def fill_path(origin : Tuple(Float64, Float64), path : Path, style : Style? = nil)
      fill_path Point.new(origin[0].to_f64, origin[1].to_f64), path, style
    end

    def fill_path(origin : Point, path : Path, style : Style? = nil)
      case style
      when Nil
        LibBlend2D.blContextFillPathD(self, origin, path).success_or_raise
      when UInt32
        LibBlend2D.blContextFillPathDRgba32(self, origin, path, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextFillPathDRgba32(self, origin, path, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextFillPathDRgba64(self, origin, path, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextFillPathDRgba64(self, origin, path, style.packed).success_or_raise
      else
        LibBlend2D.blContextFillPathDExt(self, origin, path, style).success_or_raise
      end
    end

    def fill_geometry(geometry : Geometry::Core, style : Style? = nil)
      case style
      when Nil
        LibBlend2D.blContextFillGeometry(self, geometry.type, geometry.to_unsafe).success_or_raise
      when UInt32
        LibBlend2D.blContextFillGeometryRgba32(self, geometry.type, geometry, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextFillGeometryRgba32(self, geometry.type, geometry, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextFillGeometryRgba64(self, geometry.type, geometry, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextFillGeometryRgba64(self, geometry.type, geometry, style.packed).success_or_raise
      else
        LibBlend2D.blContextFillGeometryExt(self, geometry.type, geometry, style).success_or_raise
      end
    end

    def fill_arc(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, style : Style? = nil)
      arc = Arc.new cx, cy, rx, ry, start, sweep
      fill_geometry arc, style
    end

    def fill_arc(arc : Arc, style : Style? = nil)
      fill_geometry arc, style
    end

    def fill_box(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, style : Style? = nil)
      box = Box.new x0, y0, x1, y1
      fill_geometry box, style
    end

    def fill_box(box : Box | BoxI, style : Style? = nil)
      fill_geometry box, style
    end

    def fill_circle(cx : Float64, cy : Float64, r : Float64, style : Style? = nil)
      circle = Circle.new cx, cy, r
      fill_geometry circle, style
    end

    def fill_circle(circle : Circle, style : Style? = nil)
      fill_geometry circle, style
    end

    def fill_chord(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, style : Style? = nil)
      chord = Chord.new cx, cy, rx, ry, start, sweep
      fill_geometry chord, style
    end

    def fill_chord(chord : Chord, style : Style? = nil)
      fill_geometry chord, style
    end

    def fill_ellipse(cx : Float64, cy : Float64, rx : Float64, ry : Float64, style : Style? = nil)
      ellipse = Circle.new cx, cy, rx, ry
      fill_geometry ellipse, style
    end

    def fill_ellipse(ellipse : Ellipse, style : Style? = nil)
      fill_geometry ellipse, style
    end

    def fill_line(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, style : Style? = nil)
      line = Line.new x0, y0, x1, y1
      fill_geometry line, style
    end

    def fill_line(line : Line, style : Style? = nil)
      fill_geometry line, style
    end

    def fill_pie(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, style : Style? = nil)
      pie = Pie.new cx, cy, rx, ry, start, sweep
      fill_geometry pie, style
    end

    def fill_pie(pie : Pie, style : Style? = nil)
      fill_geometry pie, style
    end

    def fill_round_rect(x : Float64, y : Float64, w : Float64, h : Float64, r : Float64, style : Style? = nil)
      round_rect = RoundRect.new x, y, w, h, r
      fill_geometry round_rect, style
    end

    def fill_round_rect(x : Float64, y : Float64, w : Float64, h : Float64, rx : Float64, ry : Float64, style : Style? = nil)
      round_rect = RoundRect.new x, y, w, h, rx, ry
      fill_geometry round_rect, style
    end

    def fill_round_rect(round_rect : RoundRect, style : Style? = nil)
      fill_geometry round_rect, style
    end

    def fill_triangle(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, style : Style? = nil)
      triangle = Triangle.new x0, y0, x1, y1, x2, y2
      fill_geometry triangle, style
    end

    def fill_triangle(triangle : Triangle, style : Style? = nil)
      fill_geometry triangle, style
    end

    def fill_text(origin : Tuple(Number, Number), font : Font, text : String, style : Style? = nil)
      fill_text Point.new(origin[0].to_f64, origin[1].to_f64), font, text, style
    end

    def fill_text(origin : Point | PointI, font : Font, text : String, style : Style? = nil)
      case origin
      in Point
        case style
        when Nil
          LibBlend2D.blContextFillUtf8TextD(self, origin, font, text, text.size).success_or_raise
        when UInt32
          LibBlend2D.blContextFillUtf8TextDRgba32(self, origin, font, text, text.size, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillUtf8TextDRgba32(self, origin, font, text, text.size, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillUtf8TextDRgba64(self, origin, font, text, text.size, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillUtf8TextDRgba64(self, origin, font, text, text.size, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillUtf8TextDExt(self, origin, font, text, text.size, style).success_or_raise
        end
      in PointI
        case style
        when Nil
          LibBlend2D.blContextFillUtf8TextI(self, origin, font, text, text.size).success_or_raise
        when UInt32
          LibBlend2D.blContextFillUtf8TextIRgba32(self, origin, font, text, text.size, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillUtf8TextIRgba32(self, origin, font, text, text.size, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillUtf8TextIRgba64(self, origin, font, text, text.size, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillUtf8TextIRgba64(self, origin, font, text, text.size, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillUtf8TextIExt(self, origin, font, text, text.size, style).success_or_raise
        end
      end
    end

    def fill_glyph_run(origin : Tuple(Number, Number), font : Font, glyph_run : GlyphRun, style : Style? = nil)
      fill_glyph_run Point.new(origin[0].to_f64, origin[1].to_f64), font, glyph_run, style
    end

    def fill_glyph_run(origin : Point | PointI, font : Font, glyph_run : GlyphRun, style : Style? = nil)
      case origin
      in Point
        case style
        when Nil
          LibBlend2D.blContextFillGlyphRunD(self, origin, font, glyph_run).success_or_raise
        when UInt32
          LibBlend2D.blContextFillGlyphRunDRgba32(self, origin, font, glyph_run, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillGlyphRunDRgba32(self, origin, font, glyph_run, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillGlyphRunDRgba64(self, origin, font, glyph_run, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillGlyphRunDRgba64(self, origin, font, glyph_run, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillGlyphRunDExt(self, origin, font, glyph_run, style).success_or_raise
        end
      in PointI
        case style
        when Nil
          LibBlend2D.blContextFillGlyphRunI(self, origin, font, glyph_run).success_or_raise
        when UInt32
          LibBlend2D.blContextFillGlyphRunIRgba32(self, origin, font, glyph_run, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillGlyphRunIRgba32(self, origin, font, glyph_run, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillGlyphRunIRgba64(self, origin, font, glyph_run, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillGlyphRunIRgba64(self, origin, font, glyph_run, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillGlyphRunIExt(self, origin, font, glyph_run, style).success_or_raise
        end
      end
    end

    def fill_mask(origin : Point | PointI, mask : Image, style : Style? = nil)
      _fill_mask origin, mask, nil, style
    end

    def fill_mask(origin : Point | PointI, mask : Image, mask_area : RectI, style : Style? = nil)
      _fill_mask origin, mask, mask_area, style
    end

    private def _fill_mask(origin : Point | PointI, mask : Image, mask_area : RectI? = Nil, style : Style? = Nil)
      case origin
      in Point
        case style
        when Nil
          LibBlend2D.blContextFillMaskD(self, origin, mask, mask_area).success_or_raise
        when UInt32
          LibBlend2D.blContextFillMaskDRgba32(self, origin, mask, mask_area, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillMaskDRgba32(self, origin, mask, mask_area, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillMaskDRgba64(self, origin, mask, mask_area, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillMaskDRgba64(self, origin, mask, mask_area, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillMaskDExt(self, origin, mask, mask_area, style).success_or_raise
        end
      in PointI
        case style
        when Nil
          LibBlend2D.blContextFillMaskI(self, origin, mask, mask_area).success_or_raise
        when UInt32
          LibBlend2D.blContextFillMaskIRgba32(self, origin, mask, mask_area, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextFillMaskIRgba32(self, origin, mask, mask_area, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextFillMaskIRgba64(self, origin, mask, mask_area, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextFillMaskIRgba64(self, origin, mask, mask_area, style.packed).success_or_raise
        else
          LibBlend2D.blContextFillMaskIExt(self, origin, mask, mask_area, style).success_or_raise
        end
      end
    end

    def stroke_rect(x : Float64, y : Float64, w : Float64, h : Float64, style : Style? = nil)
      rect = Rect.new x, y, w, h
      stroke_rect rect, style
    end

    def stroke_rect(rect : Rect | RectI, style : Style? = nil)
      case rect
      in Rect
        case style
        when Nil
          LibBlend2D.blContextStrokeRectD(self, rect).success_or_raise
        when UInt32
          LibBlend2D.blContextStrokeRectDRgba32(self, rect, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextStrokeRectDRgba32(self, rect, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextStrokeRectDRgba64(self, rect, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextStrokeRectDRgba64(self, rect, style.packed).success_or_raise
        else
          LibBlend2D.blContextStrokeRectDExt(self, rect, style).success_or_raise
        end
      in RectI
        case style
        when Nil
          LibBlend2D.blContextStrokeRectI(self, rect).success_or_raise
        when UInt32
          LibBlend2D.blContextStrokeRectIRgba32(self, rect, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextStrokeRectIRgba32(self, rect, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextStrokeRectIRgba64(self, rect, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextStrokeRectIRgba64(self, rect, style.packed).success_or_raise
        else
          LibBlend2D.blContextStrokeRectIExt(self, rect, style).success_or_raise
        end
      end
    end

    def stroke_path(path : Path, style : Style? = nil)
      stroke_path Point::ZERO, path, style
    end

    def stroke_path(origin : Tuple(Float64, Float64), path : Path, style : Style? = nil)
      stroke_path Point.new(origin[0].to_f64, origin[1].to_f64), path, style
    end

    def stroke_path(origin : Point, path : Path, style : Style? = nil)
      case style
      when Nil
        LibBlend2D.blContextStrokePathD(self, origin, path).success_or_raise
      when UInt32
        LibBlend2D.blContextStrokePathDRgba32(self, origin, path, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextStrokePathDRgba32(self, origin, path, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextStrokePathDRgba64(self, origin, path, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextStrokePathDRgba64(self, origin, path, style.packed).success_or_raise
      else
        LibBlend2D.blContextStrokePathDExt(self, origin, path, style).success_or_raise
      end
    end

    def stroke_geometry(geometry : Geometry::Core, style : Style? = nil)
      case style
      when Nil
        LibBlend2D.blContextStrokeGeometry(self, geometry.type, geometry.to_unsafe).success_or_raise
      when UInt32
        LibBlend2D.blContextStrokeGeometryRgba32(self, geometry.type, geometry, style).success_or_raise
      when RGBA32
        LibBlend2D.blContextStrokeGeometryRgba32(self, geometry.type, geometry, style.packed).success_or_raise
      when UInt64
        LibBlend2D.blContextStrokeGeometryRgba64(self, geometry.type, geometry, style).success_or_raise
      when RGBA64
        LibBlend2D.blContextStrokeGeometryRgba64(self, geometry.type, geometry, style.packed).success_or_raise
      else
        LibBlend2D.blContextStrokeGeometryExt(self, geometry.type, geometry, style).success_or_raise
      end
    end

    def stroke_arc(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, style : Style? = nil)
      arc = Arc.new cx, cy, rx, ry, start, sweep
      stroke_geometry arc, style
    end

    def stroke_arc(arc : Arc, style : Style? = nil)
      stroke_geometry arc, style
    end

    def stroke_box(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, style : Style? = nil)
      box = Box.new x0, y0, x1, y1
      stroke_geometry box, style
    end

    def stroke_box(box : Box | BoxI, style : Style? = nil)
      stroke_geometry box, style
    end

    def stroke_circle(cx : Float64, cy : Float64, r : Float64, style : Style? = nil)
      circle = Circle.new cx, cy, r
      stroke_geometry circle, style
    end

    def stroke_circle(circle : Circle, style : Style? = nil)
      stroke_geometry circle, style
    end

    def stroke_chord(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, style : Style? = nil)
      chord = Chord.new cx, cy, rx, ry, start, sweep
      stroke_geometry chord, style
    end

    def stroke_chord(chord : Chord, style : Style? = nil)
      stroke_geometry chord, style
    end

    def stroke_ellipse(cx : Float64, cy : Float64, rx : Float64, ry : Float64, style : Style? = nil)
      ellipse = Circle.new cx, cy, rx, ry
      stroke_geometry ellipse, style
    end

    def stroke_ellipse(ellipse : Ellipse, style : Style? = nil)
      stroke_geometry ellipse, style
    end

    def stroke_line(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, style : Style? = nil)
      line = Line.new x0, y0, x1, y1
      stroke_geometry line, style
    end

    def stroke_line(line : Line, style : Style? = nil)
      stroke_geometry line, style
    end

    def stroke_pie(cx : Float64, cy : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, style : Style? = nil)
      pie = Pie.new cx, cy, rx, ry, start, sweep
      stroke_geometry pie, style
    end

    def stroke_pie(pie : Pie, style : Style? = nil)
      stroke_geometry pie, style
    end

    def stroke_round_rect(x : Float64, y : Float64, w : Float64, h : Float64, r : Float64, style : Style? = nil)
      round_rect = RoundRect.new x, y, w, h, r
      stroke_geometry round_rect, style
    end

    def stroke_round_rect(x : Float64, y : Float64, w : Float64, h : Float64, rx : Float64, ry : Float64, style : Style? = nil)
      round_rect = RoundRect.new x, y, w, h, rx, ry
      stroke_geometry round_rect, style
    end

    def stroke_round_rect(round_rect : RoundRect, style : Style? = nil)
      stroke_geometry round_rect, style
    end

    def stroke_triangle(x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, style : Style? = nil)
      triangle = Triangle.new x0, y0, x1, y1, x2, y2
      stroke_geometry triangle, style
    end

    def stroke_triangle(triangle : Triangle, style : Style? = nil)
      stroke_geometry triangle, style
    end

    def stroke_text(origin : Tuple(Number, Number), font : Font, text : String, style : Style? = nil)
      stroke_text Point.new(origin[0].to_f64, origin[1].to_f64), font, text, style
    end

    def stroke_text(origin : Point | PointI, font : Font, text : String, style : Style? = nil)
      case origin
      in Point
        case style
        when Nil
          LibBlend2D.blContextStrokeUtf8TextD(self, origin, font, text, text.size).success_or_raise
        when UInt32
          LibBlend2D.blContextStrokeUtf8TextDRgba32(self, origin, font, text, text.size, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextStrokeUtf8TextDRgba32(self, origin, font, text, text.size, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextStrokeUtf8TextDRgba64(self, origin, font, text, text.size, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextStrokeUtf8TextDRgba64(self, origin, font, text, text.size, style.packed).success_or_raise
        else
          LibBlend2D.blContextStrokeUtf8TextDExt(self, origin, font, text, text.size, style).success_or_raise
        end
      in PointI
        case style
        when Nil
          LibBlend2D.blContextStrokeUtf8TextI(self, origin, font, text, text.size).success_or_raise
        when UInt32
          LibBlend2D.blContextStrokeUtf8TextIRgba32(self, origin, font, text, text.size, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextStrokeUtf8TextIRgba32(self, origin, font, text, text.size, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextStrokeUtf8TextIRgba64(self, origin, font, text, text.size, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextStrokeUtf8TextIRgba64(self, origin, font, text, text.size, style.packed).success_or_raise
        else
          LibBlend2D.blContextStrokeUtf8TextIExt(self, origin, font, text, text.size, style).success_or_raise
        end
      end
    end

    def stroke_glyph_run(origin : Tuple(Number, Number), font : Font, glyph_run : GlyphRun, style : Style? = nil)
      stroke_glyph_run Point.new(origin[0].to_f64, origin[1].to_f64), font, glyph_run, style
    end

    def stroke_glyph_run(origin : Point | PointI, font : Font, glyph_run : GlyphRun, style : Style? = nil)
      case origin
      in Point
        case style
        when Nil
          LibBlend2D.blContextStrokeGlyphRunD(self, origin, font, glyph_run).success_or_raise
        when UInt32
          LibBlend2D.blContextStrokeGlyphRunDRgba32(self, origin, font, glyph_run, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextStrokeGlyphRunDRgba32(self, origin, font, glyph_run, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextStrokeGlyphRunDRgba64(self, origin, font, glyph_run, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextStrokeGlyphRunDRgba64(self, origin, font, glyph_run, style.packed).success_or_raise
        else
          LibBlend2D.blContextStrokeGlyphRunDExt(self, origin, font, glyph_run, style).success_or_raise
        end
      in PointI
        case style
        when Nil
          LibBlend2D.blContextStrokeGlyphRunI(self, origin, font, glyph_run).success_or_raise
        when UInt32
          LibBlend2D.blContextStrokeGlyphRunIRgba32(self, origin, font, glyph_run, style).success_or_raise
        when RGBA32
          LibBlend2D.blContextStrokeGlyphRunIRgba32(self, origin, font, glyph_run, style.packed).success_or_raise
        when UInt64
          LibBlend2D.blContextStrokeGlyphRunIRgba64(self, origin, font, glyph_run, style).success_or_raise
        when RGBA64
          LibBlend2D.blContextStrokeGlyphRunIRgba64(self, origin, font, glyph_run, style.packed).success_or_raise
        else
          LibBlend2D.blContextStrokeGlyphRunIExt(self, origin, font, glyph_run, style).success_or_raise
        end
      end
    end

    def blit_image(origin : Point | PointI, img : Image, img_area : RectI? = nil)
      case origin
      in Point
        LibBlend2D.blContextBlitImageD(self, origin, img, img_area).success_or_raise
      in PointI
        LibBlend2D.blContextBlitImageI(self, origin, img, img_area).success_or_raise
      end
    end

    def blit_scaled_image(rect : Rect | RectI, img : Image, img_area : RectI? = nil)
      case rect
      in Rect
        LibBlend2D.blContextBlitScaledImageD(self, rect, img, img_area).success_or_raise
      in RectI
        LibBlend2D.blContextBlitScaledImageI(self, rect, img, img_area).success_or_raise
      end
    end
  end
end
