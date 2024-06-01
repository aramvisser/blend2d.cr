module Blend2D
  class Context
    # :nodoc:
    def reset : Bool
      LibBlend2D.blContextReset(self).success_or_raise
    end

    # :nodoc:
    def assign_move(other : Context) : Bool
      LibBlend2D.blContextAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : Context) : Bool
      LibBlend2D.blContextAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def type : ContextType
      LibBlend2D.blContextGetType(self)
    end

    # :nodoc:
    def get_target_size(targetSizeOut : LibBlend2D::BLSize*) : Bool
      LibBlend2D.blContextGetTargetSize(self, targetSizeOut).success_or_raise
    end

    # :nodoc:
    def target_image : LibBlend2D::BLImageCore*
      LibBlend2D.blContextGetTargetImage(self)
    end

    # :nodoc:
    def begin(image : Image, cci : LibBlend2D::BLContextCreateInfo*) : Bool
      LibBlend2D.blContextBegin(self, image, cci).success_or_raise
    end

    # :nodoc:
    def flush(flags : ContextFlushFlags) : Bool
      LibBlend2D.blContextFlush(self, flags).success_or_raise
    end

    # :nodoc:
    def save(cookie : LibBlend2D::BLContextCookie*) : Bool
      LibBlend2D.blContextSave(self, cookie).success_or_raise
    end

    # :nodoc:
    def restore(cookie : LibBlend2D::BLContextCookie*) : Bool
      LibBlend2D.blContextRestore(self, cookie).success_or_raise
    end

    # :nodoc:
    def get_meta_transform(transformOut : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blContextGetMetaTransform(self, transformOut).success_or_raise
    end

    # :nodoc:
    def get_user_transform(transformOut : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blContextGetUserTransform(self, transformOut).success_or_raise
    end

    # :nodoc:
    def get_final_transform(transformOut : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blContextGetFinalTransform(self, transformOut).success_or_raise
    end

    # :nodoc:
    def user_to_meta : Bool
      LibBlend2D.blContextUserToMeta(self).success_or_raise
    end

    # :nodoc:
    def apply_transform_op(opType : TransformOp, opData : Pointer) : Bool
      LibBlend2D.blContextApplyTransformOp(self, opType, opData).success_or_raise
    end

    # :nodoc:
    def get_hint(hintType : ContextHint) : UInt32
      LibBlend2D.blContextGetHint(self, hintType)
    end

    # :nodoc:
    def set_hint(hintType : ContextHint, value : UInt32) : Bool
      LibBlend2D.blContextSetHint(self, hintType, value).success_or_raise
    end

    # :nodoc:
    def get_hints(hintsOut : LibBlend2D::BLContextHints*) : Bool
      LibBlend2D.blContextGetHints(self, hintsOut).success_or_raise
    end

    # :nodoc:
    def hints=(hints : LibBlend2D::BLContextHints*)
      LibBlend2D.blContextSetHints(self, hints).success_or_raise
    end

    # :nodoc:
    def flatten_mode=(mode : FlattenMode)
      LibBlend2D.blContextSetFlattenMode(self, mode).success_or_raise
    end

    # :nodoc:
    def flatten_tolerance=(tolerance : Float64)
      LibBlend2D.blContextSetFlattenTolerance(self, tolerance).success_or_raise
    end

    # :nodoc:
    def approximation_options=(options : LibBlend2D::BLApproximationOptions*)
      LibBlend2D.blContextSetApproximationOptions(self, options).success_or_raise
    end

    # :nodoc:
    def get_fill_style(styleOut : Var) : Bool
      LibBlend2D.blContextGetFillStyle(self, styleOut).success_or_raise
    end

    # :nodoc:
    def get_transformed_fill_style(styleOut : Var) : Bool
      LibBlend2D.blContextGetTransformedFillStyle(self, styleOut).success_or_raise
    end

    # :nodoc:
    def set_fill_style_with_mode(style : Pointer, transformMode : ContextStyleTransformMode) : Bool
      LibBlend2D.blContextSetFillStyleWithMode(self, style, transformMode).success_or_raise
    end

    # :nodoc:
    def fill_style_rgba=(rgba : LibBlend2D::BLRgba*)
      LibBlend2D.blContextSetFillStyleRgba(self, rgba).success_or_raise
    end

    # :nodoc:
    def fill_style_rgba64=(rgba64 : LibC::ULong)
      LibBlend2D.blContextSetFillStyleRgba64(self, rgba64).success_or_raise
    end

    # :nodoc:
    def disable_fill_style : Bool
      LibBlend2D.blContextDisableFillStyle(self).success_or_raise
    end

    # :nodoc:
    def fill_alpha : Float64
      LibBlend2D.blContextGetFillAlpha(self)
    end

    # :nodoc:
    def fill_alpha=(alpha : Float64)
      LibBlend2D.blContextSetFillAlpha(self, alpha).success_or_raise
    end

    # :nodoc:
    def get_stroke_style(styleOut : Var) : Bool
      LibBlend2D.blContextGetStrokeStyle(self, styleOut).success_or_raise
    end

    # :nodoc:
    def get_transformed_stroke_style(styleOut : Var) : Bool
      LibBlend2D.blContextGetTransformedStrokeStyle(self, styleOut).success_or_raise
    end

    # :nodoc:
    def stroke_style=(style : Pointer)
      LibBlend2D.blContextSetStrokeStyle(self, style).success_or_raise
    end

    # :nodoc:
    def set_stroke_style_with_mode(style : Pointer, transformMode : ContextStyleTransformMode) : Bool
      LibBlend2D.blContextSetStrokeStyleWithMode(self, style, transformMode).success_or_raise
    end

    # :nodoc:
    def stroke_style_rgba=(rgba : LibBlend2D::BLRgba*)
      LibBlend2D.blContextSetStrokeStyleRgba(self, rgba).success_or_raise
    end

    # :nodoc:
    def stroke_style_rgba32=(rgba32 : UInt32)
      LibBlend2D.blContextSetStrokeStyleRgba32(self, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_style_rgba64=(rgba64 : LibC::ULong)
      LibBlend2D.blContextSetStrokeStyleRgba64(self, rgba64).success_or_raise
    end

    # :nodoc:
    def disable_stroke_style : Bool
      LibBlend2D.blContextDisableStrokeStyle(self).success_or_raise
    end

    # :nodoc:
    def stroke_alpha : Float64
      LibBlend2D.blContextGetStrokeAlpha(self)
    end

    # :nodoc:
    def stroke_alpha=(alpha : Float64)
      LibBlend2D.blContextSetStrokeAlpha(self, alpha).success_or_raise
    end

    # :nodoc:
    def swap_styles(mode : ContextStyleSwapMode) : Bool
      LibBlend2D.blContextSwapStyles(self, mode).success_or_raise
    end

    # :nodoc:
    def global_alpha : Float64
      LibBlend2D.blContextGetGlobalAlpha(self)
    end

    # :nodoc:
    def global_alpha=(alpha : Float64)
      LibBlend2D.blContextSetGlobalAlpha(self, alpha).success_or_raise
    end

    # :nodoc:
    def fill_rule : FillRule
      LibBlend2D.blContextGetFillRule(self)
    end

    # :nodoc:
    def fill_rule=(fillRule : FillRule)
      LibBlend2D.blContextSetFillRule(self, fillRule).success_or_raise
    end

    # :nodoc:
    def stroke_miter_limit : Float64
      LibBlend2D.blContextGetStrokeMiterLimit(self)
    end

    # :nodoc:
    def stroke_miter_limit=(miterLimit : Float64)
      LibBlend2D.blContextSetStrokeMiterLimit(self, miterLimit).success_or_raise
    end

    # :nodoc:
    def get_stroke_cap(position : StrokeCapPosition) : StrokeCap
      LibBlend2D.blContextGetStrokeCap(self, position)
    end

    # :nodoc:
    def stroke_caps=(strokeCap : StrokeCap)
      LibBlend2D.blContextSetStrokeCaps(self, strokeCap).success_or_raise
    end

    # :nodoc:
    def stroke_join : StrokeJoin
      LibBlend2D.blContextGetStrokeJoin(self)
    end

    # :nodoc:
    def stroke_join=(strokeJoin : StrokeJoin)
      LibBlend2D.blContextSetStrokeJoin(self, strokeJoin).success_or_raise
    end

    # :nodoc:
    def stroke_transform_order : StrokeTransformOrder
      LibBlend2D.blContextGetStrokeTransformOrder(self)
    end

    # :nodoc:
    def stroke_transform_order=(transformOrder : StrokeTransformOrder)
      LibBlend2D.blContextSetStrokeTransformOrder(self, transformOrder).success_or_raise
    end

    # :nodoc:
    def stroke_dash_offset : Float64
      LibBlend2D.blContextGetStrokeDashOffset(self)
    end

    # :nodoc:
    def stroke_dash_offset=(dashOffset : Float64)
      LibBlend2D.blContextSetStrokeDashOffset(self, dashOffset).success_or_raise
    end

    # :nodoc:
    def get_stroke_dash_array(dashArrayOut : Array) : Bool
      LibBlend2D.blContextGetStrokeDashArray(self, dashArrayOut).success_or_raise
    end

    # :nodoc:
    def stroke_dash_array=(dashArray : Array)
      LibBlend2D.blContextSetStrokeDashArray(self, dashArray).success_or_raise
    end

    # :nodoc:
    def get_stroke_options(options : StrokeOptions) : Bool
      LibBlend2D.blContextGetStrokeOptions(self, options).success_or_raise
    end

    # :nodoc:
    def stroke_options=(options : StrokeOptions)
      LibBlend2D.blContextSetStrokeOptions(self, options).success_or_raise
    end

    # :nodoc:
    def clip_to_rect_i(rect : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextClipToRectI(self, rect).success_or_raise
    end

    # :nodoc:
    def clip_to_rect_d(rect : LibBlend2D::BLRect*) : Bool
      LibBlend2D.blContextClipToRectD(self, rect).success_or_raise
    end

    # :nodoc:
    def restore_clipping : Bool
      LibBlend2D.blContextRestoreClipping(self).success_or_raise
    end

    # :nodoc:
    def clear_all : Bool
      LibBlend2D.blContextClearAll(self).success_or_raise
    end

    # :nodoc:
    def clear_rect_i(rect : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextClearRectI(self, rect).success_or_raise
    end

    # :nodoc:
    def clear_rect_d(rect : LibBlend2D::BLRect*) : Bool
      LibBlend2D.blContextClearRectD(self, rect).success_or_raise
    end

    # :nodoc:
    def fill_all_rgba64(rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillAllRgba64(self, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_all_ext(style : Pointer) : Bool
      LibBlend2D.blContextFillAllExt(self, style).success_or_raise
    end

    # :nodoc:
    def fill_rect_i(rect : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextFillRectI(self, rect).success_or_raise
    end

    # :nodoc:
    def fill_rect_i_rgba32(rect : LibBlend2D::BLRectI*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillRectIRgba32(self, rect, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_rect_i_rgba64(rect : LibBlend2D::BLRectI*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillRectIRgba64(self, rect, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_rect_i_ext(rect : LibBlend2D::BLRectI*, style : Pointer) : Bool
      LibBlend2D.blContextFillRectIExt(self, rect, style).success_or_raise
    end

    # :nodoc:
    def fill_rect_d(rect : LibBlend2D::BLRect*) : Bool
      LibBlend2D.blContextFillRectD(self, rect).success_or_raise
    end

    # :nodoc:
    def fill_rect_d_rgba32(rect : LibBlend2D::BLRect*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillRectDRgba32(self, rect, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_rect_d_rgba64(rect : LibBlend2D::BLRect*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillRectDRgba64(self, rect, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_rect_d_ext(rect : LibBlend2D::BLRect*, style : Pointer) : Bool
      LibBlend2D.blContextFillRectDExt(self, rect, style).success_or_raise
    end

    # :nodoc:
    def fill_path_d_rgba32(origin : LibBlend2D::BLPoint*, path : Path, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillPathDRgba32(self, origin, path, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_path_d_rgba64(origin : LibBlend2D::BLPoint*, path : Path, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillPathDRgba64(self, origin, path, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_path_d_ext(origin : LibBlend2D::BLPoint*, path : Path, style : Pointer) : Bool
      LibBlend2D.blContextFillPathDExt(self, origin, path, style).success_or_raise
    end

    # :nodoc:
    def fill_geometry(type : GeometryType, data : Pointer) : Bool
      LibBlend2D.blContextFillGeometry(self, type, data).success_or_raise
    end

    # :nodoc:
    def fill_geometry_rgba32(type : GeometryType, data : Pointer, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillGeometryRgba32(self, type, data, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_geometry_rgba64(type : GeometryType, data : Pointer, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillGeometryRgba64(self, type, data, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf8_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf8TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def fill_utf8_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf8TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_utf8_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf8TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf8_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf8TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def fill_utf8_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf8TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf16TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf16TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf16TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf16TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf16TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf16TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf16TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf16_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf16TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf32TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf32TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf32TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf32TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf32TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf32TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf32TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_utf32_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf32TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_i(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*) : Bool
      LibBlend2D.blContextFillGlyphRunI(self, origin, font, glyphRun).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillGlyphRunIRgba32(self, origin, font, glyphRun, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillGlyphRunIRgba64(self, origin, font, glyphRun, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_i_ext(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, style : Pointer) : Bool
      LibBlend2D.blContextFillGlyphRunIExt(self, origin, font, glyphRun, style).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_d(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*) : Bool
      LibBlend2D.blContextFillGlyphRunD(self, origin, font, glyphRun).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillGlyphRunDRgba64(self, origin, font, glyphRun, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_glyph_run_d_ext(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, style : Pointer) : Bool
      LibBlend2D.blContextFillGlyphRunDExt(self, origin, font, glyphRun, style).success_or_raise
    end

    # :nodoc:
    def fill_mask_i(origin : LibBlend2D::BLPointI*, mask : Image, maskArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextFillMaskI(self, origin, mask, maskArea).success_or_raise
    end

    # :nodoc:
    def fill_mask_i_rgba32(origin : LibBlend2D::BLPointI*, mask : Image, maskArea : LibBlend2D::BLRectI*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillMaskIRgba32(self, origin, mask, maskArea, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_mask_i_rgba64(origin : LibBlend2D::BLPointI*, mask : Image, maskArea : LibBlend2D::BLRectI*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillMaskIRgba64(self, origin, mask, maskArea, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_mask_i_ext(origin : LibBlend2D::BLPointI*, mask : Image, maskArea : LibBlend2D::BLRectI*, style : Pointer) : Bool
      LibBlend2D.blContextFillMaskIExt(self, origin, mask, maskArea, style).success_or_raise
    end

    # :nodoc:
    def fill_mask_d(origin : LibBlend2D::BLPoint*, mask : Image, maskArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextFillMaskD(self, origin, mask, maskArea).success_or_raise
    end

    # :nodoc:
    def fill_mask_d_rgba32(origin : LibBlend2D::BLPoint*, mask : Image, maskArea : LibBlend2D::BLRectI*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillMaskDRgba32(self, origin, mask, maskArea, rgba32).success_or_raise
    end

    # :nodoc:
    def fill_mask_d_rgba64(origin : LibBlend2D::BLPoint*, mask : Image, maskArea : LibBlend2D::BLRectI*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillMaskDRgba64(self, origin, mask, maskArea, rgba64).success_or_raise
    end

    # :nodoc:
    def fill_mask_d_ext(origin : LibBlend2D::BLPoint*, mask : Image, maskArea : LibBlend2D::BLRectI*, style : Pointer) : Bool
      LibBlend2D.blContextFillMaskDExt(self, origin, mask, maskArea, style).success_or_raise
    end

    # :nodoc:
    def stroke_rect_i(rect : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextStrokeRectI(self, rect).success_or_raise
    end

    # :nodoc:
    def stroke_rect_i_rgba32(rect : LibBlend2D::BLRectI*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeRectIRgba32(self, rect, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_rect_i_rgba64(rect : LibBlend2D::BLRectI*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeRectIRgba64(self, rect, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_rect_i_ext(rect : LibBlend2D::BLRectI*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeRectIExt(self, rect, style).success_or_raise
    end

    # :nodoc:
    def stroke_rect_d(rect : LibBlend2D::BLRect*) : Bool
      LibBlend2D.blContextStrokeRectD(self, rect).success_or_raise
    end

    # :nodoc:
    def stroke_rect_d_rgba32(rect : LibBlend2D::BLRect*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeRectDRgba32(self, rect, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_rect_d_rgba64(rect : LibBlend2D::BLRect*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeRectDRgba64(self, rect, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_rect_d_ext(rect : LibBlend2D::BLRect*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeRectDExt(self, rect, style).success_or_raise
    end

    # :nodoc:
    def stroke_path_d_rgba32(origin : LibBlend2D::BLPoint*, path : Path, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokePathDRgba32(self, origin, path, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_path_d_rgba64(origin : LibBlend2D::BLPoint*, path : Path, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokePathDRgba64(self, origin, path, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_geometry_rgba32(type : GeometryType, data : Pointer, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGeometryRgba32(self, type, data, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_geometry_rgba64(type : GeometryType, data : Pointer, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeGeometryRgba64(self, type, data, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_geometry_ext(type : GeometryType, data : Pointer, style : Pointer) : Bool
      LibBlend2D.blContextStrokeGeometryExt(self, type, data, style).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf8TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf8TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf8TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf8TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf8TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf8TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf8TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_utf8_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf8TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf16TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf16TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf16TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf16TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf16TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf16TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf16TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_utf16_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf16TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf32TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf32TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf32TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf32TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf32TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf32TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf32TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_utf32_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf32TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_i(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*) : Bool
      LibBlend2D.blContextStrokeGlyphRunI(self, origin, font, glyphRun).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGlyphRunIRgba32(self, origin, font, glyphRun, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeGlyphRunIRgba64(self, origin, font, glyphRun, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_i_ext(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeGlyphRunIExt(self, origin, font, glyphRun, style).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_d(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*) : Bool
      LibBlend2D.blContextStrokeGlyphRunD(self, origin, font, glyphRun).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGlyphRunDRgba32(self, origin, font, glyphRun, rgba32).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeGlyphRunDRgba64(self, origin, font, glyphRun, rgba64).success_or_raise
    end

    # :nodoc:
    def stroke_glyph_run_d_ext(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeGlyphRunDExt(self, origin, font, glyphRun, style).success_or_raise
    end

    # :nodoc:
    def blit_image_i(origin : LibBlend2D::BLPointI*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitImageI(self, origin, img, imgArea).success_or_raise
    end

    # :nodoc:
    def blit_image_d(origin : LibBlend2D::BLPoint*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitImageD(self, origin, img, imgArea).success_or_raise
    end

    # :nodoc:
    def blit_scaled_image_i(rect : LibBlend2D::BLRectI*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitScaledImageI(self, rect, img, imgArea).success_or_raise
    end

    # :nodoc:
    def blit_scaled_image_d(rect : LibBlend2D::BLRect*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitScaledImageD(self, rect, img, imgArea).success_or_raise
    end
  end
end
