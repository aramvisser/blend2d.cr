module Blend2D::Text
  class FontFeatureSettings
    # :nodoc:
    private def initialize
      LibBlend2D.blFontFeatureSettingsInit(out @core).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blFontFeatureSettingsDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blFontFeatureSettingsReset(self).success_or_raise
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blFontFeatureSettingsClear(self).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blFontFeatureSettingsShrink(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : FontFeatureSettings) : Bool
      LibBlend2D.blFontFeatureSettingsAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : FontFeatureSettings) : Bool
      LibBlend2D.blFontFeatureSettingsAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def size : Int32
      LibBlend2D.blFontFeatureSettingsGetSize(self)
    end

    # :nodoc:
    private def capacity : Int32
      LibBlend2D.blFontFeatureSettingsGetCapacity(self)
    end

    # :nodoc:
    private def get_view(out_ : LibBlend2D::BLFontFeatureSettingsView*) : Bool
      LibBlend2D.blFontFeatureSettingsGetView(self, out_).success_or_raise
    end

    # :nodoc:
    private def has_value(featureTag : LibBlend2D::BLTag) : Int32
      LibBlend2D.blFontFeatureSettingsHasValue(self, featureTag)
    end

    # :nodoc:
    private def get_value(featureTag : LibBlend2D::BLTag) : UInt32
      LibBlend2D.blFontFeatureSettingsGetValue(self, featureTag)
    end

    # :nodoc:
    private def set_value(featureTag : LibBlend2D::BLTag, value : UInt32) : Bool
      LibBlend2D.blFontFeatureSettingsSetValue(self, featureTag, value).success_or_raise
    end

    # :nodoc:
    private def remove_value(featureTag : LibBlend2D::BLTag) : Bool
      LibBlend2D.blFontFeatureSettingsRemoveValue(self, featureTag).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : FontFeatureSettings, b : FontFeatureSettings) : Int32
      LibBlend2D.blFontFeatureSettingsEquals(a, b)
    end
  end
end
