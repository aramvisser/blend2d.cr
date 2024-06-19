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
  end
end
