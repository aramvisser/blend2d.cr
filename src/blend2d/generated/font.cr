module Blend2D
  class Font
    # :nodoc:
    private def initialize
      LibBlend2D.blFontInit(out @core).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blFontReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Font) : Bool
      LibBlend2D.blFontAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Font) : Bool
      LibBlend2D.blFontAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Font, b : Font) : Int32
      LibBlend2D.blFontEquals(a, b)
    end

    # :nodoc:
    private def create_from_face(face : FontFace, size : Float32) : Bool
      LibBlend2D.blFontCreateFromFace(self, face, size).success_or_raise
    end

    # :nodoc:
    private def create_from_face_with_settings(face : FontFace, size : Float32, featureSettings : FontFeatureSettings, variationSettings : FontVariationSettings) : Bool
      LibBlend2D.blFontCreateFromFaceWithSettings(self, face, size, featureSettings, variationSettings).success_or_raise
    end

    # :nodoc:
    private def get_face(out_ : FontFace) : Bool
      LibBlend2D.blFontGetFace(self, out_).success_or_raise
    end

    # :nodoc:
    private def size : Float32
      LibBlend2D.blFontGetSize(self)
    end

    # :nodoc:
    private def size=(size : Float32)
      LibBlend2D.blFontSetSize(self, size).success_or_raise
    end

    # :nodoc:
    private def get_matrix(out_ : LibBlend2D::BLFontMatrix*) : Bool
      LibBlend2D.blFontGetMatrix(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_design_metrics(out_ : LibBlend2D::BLFontDesignMetrics*) : Bool
      LibBlend2D.blFontGetDesignMetrics(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_feature_settings(out_ : FontFeatureSettings) : Bool
      LibBlend2D.blFontGetFeatureSettings(self, out_).success_or_raise
    end

    # :nodoc:
    private def feature_settings=(featureSettings : FontFeatureSettings)
      LibBlend2D.blFontSetFeatureSettings(self, featureSettings).success_or_raise
    end

    # :nodoc:
    private def reset_feature_settings : Bool
      LibBlend2D.blFontResetFeatureSettings(self).success_or_raise
    end

    # :nodoc:
    private def get_variation_settings(out_ : FontVariationSettings) : Bool
      LibBlend2D.blFontGetVariationSettings(self, out_).success_or_raise
    end

    # :nodoc:
    private def variation_settings=(variationSettings : FontVariationSettings)
      LibBlend2D.blFontSetVariationSettings(self, variationSettings).success_or_raise
    end

    # :nodoc:
    private def reset_variation_settings : Bool
      LibBlend2D.blFontResetVariationSettings(self).success_or_raise
    end

    # :nodoc:
    private def map_text_to_glyphs(gb : GlyphBuffer, stateOut : LibBlend2D::BLGlyphMappingState*) : Bool
      LibBlend2D.blFontMapTextToGlyphs(self, gb, stateOut).success_or_raise
    end

    # :nodoc:
    private def position_glyphs(gb : GlyphBuffer) : Bool
      LibBlend2D.blFontPositionGlyphs(self, gb).success_or_raise
    end

    # :nodoc:
    private def apply_kerning(gb : GlyphBuffer) : Bool
      LibBlend2D.blFontApplyKerning(self, gb).success_or_raise
    end

    # :nodoc:
    private def apply_g_sub(gb : GlyphBuffer, lookups : BitArray) : Bool
      LibBlend2D.blFontApplyGSub(self, gb, lookups).success_or_raise
    end

    # :nodoc:
    private def apply_g_pos(gb : GlyphBuffer, lookups : BitArray) : Bool
      LibBlend2D.blFontApplyGPos(self, gb, lookups).success_or_raise
    end

    # :nodoc:
    private def get_glyph_bounds(glyphData : UInt32*, glyphAdvance : LibC::Long, out_ : LibBlend2D::BLBoxI*, count : Int32) : Bool
      LibBlend2D.blFontGetGlyphBounds(self, glyphData, glyphAdvance, out_, count).success_or_raise
    end

    # :nodoc:
    private def get_glyph_advances(glyphData : UInt32*, glyphAdvance : LibC::Long, out_ : LibBlend2D::BLGlyphPlacement*, count : Int32) : Bool
      LibBlend2D.blFontGetGlyphAdvances(self, glyphData, glyphAdvance, out_, count).success_or_raise
    end

    # :nodoc:
    private def get_glyph_outlines(glyphId : LibBlend2D::BLGlyphId, userTransform : LibBlend2D::BLMatrix2D*, out_ : Path, sink : LibBlend2D::BLPathSinkFunc, userData : Pointer) : Bool
      LibBlend2D.blFontGetGlyphOutlines(self, glyphId, userTransform, out_, sink, userData).success_or_raise
    end

    # :nodoc:
    private def get_glyph_run_outlines(glyphRun : LibBlend2D::BLGlyphRun*, userTransform : LibBlend2D::BLMatrix2D*, out_ : Path, sink : LibBlend2D::BLPathSinkFunc, userData : Pointer) : Bool
      LibBlend2D.blFontGetGlyphRunOutlines(self, glyphRun, userTransform, out_, sink, userData).success_or_raise
    end
  end
end
