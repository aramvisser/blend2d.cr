module Blend2D
  class FontManager
    # :nodoc:
    def initialize
      LibBlend2D.blFontManagerInit(out @core).success_or_raise
    end

    # :nodoc:
    def initialize
      LibBlend2D.blFontManagerInitNew(out @core).success_or_raise
    end

    # :nodoc:
    def finalize
      LibBlend2D.blFontManagerDestroy(self).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blFontManagerReset(self).success_or_raise
    end

    # :nodoc:
    def assign_move(other : FontManager) : Bool
      LibBlend2D.blFontManagerAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : FontManager) : Bool
      LibBlend2D.blFontManagerAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def create : Bool
      LibBlend2D.blFontManagerCreate(self).success_or_raise
    end

    # :nodoc:
    def face_count : Int32
      LibBlend2D.blFontManagerGetFaceCount(self)
    end

    # :nodoc:
    def family_count : Int32
      LibBlend2D.blFontManagerGetFamilyCount(self)
    end

    # :nodoc:
    def has_face(face : FontFace) : Int32
      LibBlend2D.blFontManagerHasFace(self, face)
    end

    # :nodoc:
    def add_face(face : FontFace) : Bool
      LibBlend2D.blFontManagerAddFace(self, face).success_or_raise
    end

    # :nodoc:
    def query_face(name : UInt8*, nameSize : Int32, properties : LibBlend2D::BLFontQueryProperties*, out_ : FontFace) : Bool
      LibBlend2D.blFontManagerQueryFace(self, name, nameSize, properties, out_).success_or_raise
    end

    # :nodoc:
    def query_faces_by_family_name(name : UInt8*, nameSize : Int32, out_ : Array) : Bool
      LibBlend2D.blFontManagerQueryFacesByFamilyName(self, name, nameSize, out_).success_or_raise
    end

    # :nodoc:
    def self.equals(a : FontManager, b : FontManager) : Int32
      LibBlend2D.blFontManagerEquals(a, b)
    end
  end
end
