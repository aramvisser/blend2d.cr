module Blend2D
  class FontFace
    # :nodoc:
    private def reset : Bool
      LibBlend2D.blFontFaceReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : FontFace) : Bool
      LibBlend2D.blFontFaceAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : FontFace) : Bool
      LibBlend2D.blFontFaceAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : FontFace, b : FontFace) : Int32
      LibBlend2D.blFontFaceEquals(a, b)
    end

    # :nodoc:
    private def create_from_data(fontData : FontData, faceIndex : UInt32) : Bool
      LibBlend2D.blFontFaceCreateFromData(self, fontData, faceIndex).success_or_raise
    end

    # :nodoc:
    private def get_full_name(out_ : String) : Bool
      LibBlend2D.blFontFaceGetFullName(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_family_name(out_ : String) : Bool
      LibBlend2D.blFontFaceGetFamilyName(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_subfamily_name(out_ : String) : Bool
      LibBlend2D.blFontFaceGetSubfamilyName(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_post_script_name(out_ : String) : Bool
      LibBlend2D.blFontFaceGetPostScriptName(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_face_info(out_ : LibBlend2D::BLFontFaceInfo*) : Bool
      LibBlend2D.blFontFaceGetFaceInfo(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_design_metrics(out_ : LibBlend2D::BLFontDesignMetrics*) : Bool
      LibBlend2D.blFontFaceGetDesignMetrics(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_unicode_coverage(out_ : LibBlend2D::BLFontUnicodeCoverage*) : Bool
      LibBlend2D.blFontFaceGetUnicodeCoverage(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_character_coverage(out_ : BitSet) : Bool
      LibBlend2D.blFontFaceGetCharacterCoverage(self, out_).success_or_raise
    end

    # :nodoc:
    private def has_script_tag(scriptTag : LibBlend2D::BLTag) : Int32
      LibBlend2D.blFontFaceHasScriptTag(self, scriptTag)
    end

    # :nodoc:
    private def has_feature_tag(featureTag : LibBlend2D::BLTag) : Int32
      LibBlend2D.blFontFaceHasFeatureTag(self, featureTag)
    end

    # :nodoc:
    private def has_variation_tag(variationTag : LibBlend2D::BLTag) : Int32
      LibBlend2D.blFontFaceHasVariationTag(self, variationTag)
    end

    # :nodoc:
    private def get_script_tags(out_ : Array) : Bool
      LibBlend2D.blFontFaceGetScriptTags(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_feature_tags(out_ : Array) : Bool
      LibBlend2D.blFontFaceGetFeatureTags(self, out_).success_or_raise
    end

    # :nodoc:
    private def get_variation_tags(out_ : Array) : Bool
      LibBlend2D.blFontFaceGetVariationTags(self, out_).success_or_raise
    end
  end
end
