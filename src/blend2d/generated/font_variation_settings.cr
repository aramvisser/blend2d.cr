module Blend2D::Text
  class FontVariationSettings
    # :nodoc:
    private def initialize
      LibBlend2D.blFontVariationSettingsInit(out @core).success_or_raise
    end

    # :nodoc:
    private def finalize
      LibBlend2D.blFontVariationSettingsDestroy(self).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blFontVariationSettingsReset(self).success_or_raise
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blFontVariationSettingsClear(self).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blFontVariationSettingsShrink(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : FontVariationSettings) : Bool
      LibBlend2D.blFontVariationSettingsAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : FontVariationSettings) : Bool
      LibBlend2D.blFontVariationSettingsAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def size : Int32
      LibBlend2D.blFontVariationSettingsGetSize(self)
    end

    # :nodoc:
    private def capacity : Int32
      LibBlend2D.blFontVariationSettingsGetCapacity(self)
    end

    # :nodoc:
    private def get_view(out_ : LibBlend2D::BLFontVariationSettingsView*) : Bool
      LibBlend2D.blFontVariationSettingsGetView(self, out_).success_or_raise
    end

    # :nodoc:
    private def has_value(variationTag : LibBlend2D::BLTag) : Int32
      LibBlend2D.blFontVariationSettingsHasValue(self, variationTag)
    end

    # :nodoc:
    private def get_value(variationTag : LibBlend2D::BLTag) : Float32
      LibBlend2D.blFontVariationSettingsGetValue(self, variationTag)
    end

    # :nodoc:
    private def set_value(variationTag : LibBlend2D::BLTag, value : Float32) : Bool
      LibBlend2D.blFontVariationSettingsSetValue(self, variationTag, value).success_or_raise
    end

    # :nodoc:
    private def remove_value(variationTag : LibBlend2D::BLTag) : Bool
      LibBlend2D.blFontVariationSettingsRemoveValue(self, variationTag).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : FontVariationSettings, b : FontVariationSettings) : Int32
      LibBlend2D.blFontVariationSettingsEquals(a, b)
    end
  end
end
