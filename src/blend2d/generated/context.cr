module Blend2D
  class Context
    # :nodoc:
    private def reset : Bool
      LibBlend2D.blContextReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Context) : Bool
      LibBlend2D.blContextAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Context) : Bool
      LibBlend2D.blContextAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def target_image : LibBlend2D::BLImageCore*
      LibBlend2D.blContextGetTargetImage(self)
    end

    # :nodoc:
    private def flush(flags : ContextFlushFlags) : Bool
      LibBlend2D.blContextFlush(self, flags).success_or_raise
    end

    # :nodoc:
    private def approximation_options=(options : LibBlend2D::BLApproximationOptions*)
      LibBlend2D.blContextSetApproximationOptions(self, options).success_or_raise
    end

    # :nodoc:
    private def set_fill_style_with_mode(style : Pointer, transformMode : ContextStyleTransformMode) : Bool
      LibBlend2D.blContextSetFillStyleWithMode(self, style, transformMode).success_or_raise
    end

    # :nodoc:
    private def set_stroke_style_with_mode(style : Pointer, transformMode : ContextStyleTransformMode) : Bool
      LibBlend2D.blContextSetStrokeStyleWithMode(self, style, transformMode).success_or_raise
    end

    # :nodoc:
    private def stroke_dash_offset : Float64
      LibBlend2D.blContextGetStrokeDashOffset(self)
    end

    # :nodoc:
    private def stroke_dash_offset=(dashOffset : Float64)
      LibBlend2D.blContextSetStrokeDashOffset(self, dashOffset).success_or_raise
    end

    # :nodoc:
    private def get_stroke_dash_array(dashArrayOut : Array) : Bool
      LibBlend2D.blContextGetStrokeDashArray(self, dashArrayOut).success_or_raise
    end

    # :nodoc:
    private def stroke_dash_array=(dashArray : Array)
      LibBlend2D.blContextSetStrokeDashArray(self, dashArray).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf16TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf16TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf16TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf16TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf16TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf16TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf16TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def fill_utf16_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf16TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf32TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf32TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf32TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf32TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextFillUtf32TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextFillUtf32TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextFillUtf32TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def fill_utf32_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextFillUtf32TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_i(rect : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextStrokeRectI(self, rect).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_i_rgba32(rect : LibBlend2D::BLRectI*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeRectIRgba32(self, rect, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_i_rgba64(rect : LibBlend2D::BLRectI*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeRectIRgba64(self, rect, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_i_ext(rect : LibBlend2D::BLRectI*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeRectIExt(self, rect, style).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_d(rect : LibBlend2D::BLRect*) : Bool
      LibBlend2D.blContextStrokeRectD(self, rect).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_d_rgba32(rect : LibBlend2D::BLRect*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeRectDRgba32(self, rect, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_d_rgba64(rect : LibBlend2D::BLRect*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeRectDRgba64(self, rect, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_rect_d_ext(rect : LibBlend2D::BLRect*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeRectDExt(self, rect, style).success_or_raise
    end

    # :nodoc:
    private def stroke_path_d_rgba32(origin : LibBlend2D::BLPoint*, path : Path, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokePathDRgba32(self, origin, path, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_path_d_rgba64(origin : LibBlend2D::BLPoint*, path : Path, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokePathDRgba64(self, origin, path, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_geometry_rgba64(type : GeometryType, data : Pointer, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeGeometryRgba64(self, type, data, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_geometry_ext(type : GeometryType, data : Pointer, style : Pointer) : Bool
      LibBlend2D.blContextStrokeGeometryExt(self, type, data, style).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf8TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf8TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf8TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt8*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf8TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf8TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf8TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf8TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_utf8_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt8*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf8TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf16TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf16TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf16TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf16TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf16TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf16TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf16TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_utf16_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt16*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf16TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_i(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf32TextI(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf32TextIRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf32TextIRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_i_ext(origin : LibBlend2D::BLPointI*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf32TextIExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_d(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32) : Bool
      LibBlend2D.blContextStrokeUtf32TextD(self, origin, font, text, size).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeUtf32TextDRgba32(self, origin, font, text, size, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeUtf32TextDRgba64(self, origin, font, text, size, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_utf32_text_d_ext(origin : LibBlend2D::BLPoint*, font : Font, text : UInt32*, size : Int32, style : Pointer) : Bool
      LibBlend2D.blContextStrokeUtf32TextDExt(self, origin, font, text, size, style).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_i(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*) : Bool
      LibBlend2D.blContextStrokeGlyphRunI(self, origin, font, glyphRun).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_i_rgba32(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGlyphRunIRgba32(self, origin, font, glyphRun, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_i_rgba64(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeGlyphRunIRgba64(self, origin, font, glyphRun, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_i_ext(origin : LibBlend2D::BLPointI*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeGlyphRunIExt(self, origin, font, glyphRun, style).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_d(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*) : Bool
      LibBlend2D.blContextStrokeGlyphRunD(self, origin, font, glyphRun).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_d_rgba32(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba32 : UInt32) : Bool
      LibBlend2D.blContextStrokeGlyphRunDRgba32(self, origin, font, glyphRun, rgba32).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_d_rgba64(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blContextStrokeGlyphRunDRgba64(self, origin, font, glyphRun, rgba64).success_or_raise
    end

    # :nodoc:
    private def stroke_glyph_run_d_ext(origin : LibBlend2D::BLPoint*, font : Font, glyphRun : LibBlend2D::BLGlyphRun*, style : Pointer) : Bool
      LibBlend2D.blContextStrokeGlyphRunDExt(self, origin, font, glyphRun, style).success_or_raise
    end

    # :nodoc:
    private def blit_image_i(origin : LibBlend2D::BLPointI*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitImageI(self, origin, img, imgArea).success_or_raise
    end

    # :nodoc:
    private def blit_image_d(origin : LibBlend2D::BLPoint*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitImageD(self, origin, img, imgArea).success_or_raise
    end

    # :nodoc:
    private def blit_scaled_image_i(rect : LibBlend2D::BLRectI*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitScaledImageI(self, rect, img, imgArea).success_or_raise
    end

    # :nodoc:
    private def blit_scaled_image_d(rect : LibBlend2D::BLRect*, img : Image, imgArea : LibBlend2D::BLRectI*) : Bool
      LibBlend2D.blContextBlitScaledImageD(self, rect, img, imgArea).success_or_raise
    end
  end
end
