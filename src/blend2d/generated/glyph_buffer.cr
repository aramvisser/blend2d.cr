module Blend2D::Text
  class GlyphBuffer
    # :nodoc:
    private def reset : Bool
      LibBlend2D.blGlyphBufferReset(self).success_or_raise
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blGlyphBufferClear(self).success_or_raise
    end

    # :nodoc:
    private def size : Int32
      LibBlend2D.blGlyphBufferGetSize(self)
    end

    # :nodoc:
    private def flags : UInt32
      LibBlend2D.blGlyphBufferGetFlags(self)
    end

    # :nodoc:
    private def content : UInt32*
      LibBlend2D.blGlyphBufferGetContent(self)
    end

    # :nodoc:
    private def info_data : LibBlend2D::BLGlyphInfo*
      LibBlend2D.blGlyphBufferGetInfoData(self)
    end

    # :nodoc:
    private def placement_data : LibBlend2D::BLGlyphPlacement*
      LibBlend2D.blGlyphBufferGetPlacementData(self)
    end

    # :nodoc:
    private def set_glyphs(glyphData : UInt32*, size : Int32) : Bool
      LibBlend2D.blGlyphBufferSetGlyphs(self, glyphData, size).success_or_raise
    end

    # :nodoc:
    private def set_glyphs_from_struct(glyphData : Pointer, size : Int32, glyphIdSize : Int32, glyphIdAdvance : LibC::Long) : Bool
      LibBlend2D.blGlyphBufferSetGlyphsFromStruct(self, glyphData, size, glyphIdSize, glyphIdAdvance).success_or_raise
    end

    # :nodoc:
    private def set_debug_sink(sink : LibBlend2D::BLDebugMessageSinkFunc, userData : Pointer) : Bool
      LibBlend2D.blGlyphBufferSetDebugSink(self, sink, userData).success_or_raise
    end

    # :nodoc:
    private def reset_debug_sink : Bool
      LibBlend2D.blGlyphBufferResetDebugSink(self).success_or_raise
    end
  end
end
