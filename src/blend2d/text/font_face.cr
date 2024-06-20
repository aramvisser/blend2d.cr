module Blend2D::Text
  class FontFace < Core(LibBlend2D::BLFontFaceCore)
    def initialize(filename, read_flags : FileReadFlags = FileReadFlags::NoFlags)
      LibBlend2D.blFontFaceInit(out @core).success_or_raise
      LibBlend2D.blFontFaceCreateFromFile(self, filename.to_s, read_flags).success_or_raise
    end

    def finalize
      LibBlend2D.blFontFaceDestroy(self).success_or_raise
    end
  end
end
