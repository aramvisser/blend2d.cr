module Blend2D::Imaging
  class ImageCodec
    # :nodoc:
    private def reset : Bool
      LibBlend2D.blImageCodecReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : ImageCodec) : Bool
      LibBlend2D.blImageCodecAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : ImageCodec) : Bool
      LibBlend2D.blImageCodecAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def find_by_data(data : Pointer, size : Int32, codecs : Array) : Bool
      LibBlend2D.blImageCodecFindByData(self, data, size, codecs).success_or_raise
    end

    # :nodoc:
    private def inspect_data(data : Pointer, size : Int32) : UInt32
      LibBlend2D.blImageCodecInspectData(self, data, size)
    end

    # :nodoc:
    private def create_decoder(dst : ImageDecoder) : Bool
      LibBlend2D.blImageCodecCreateDecoder(self, dst).success_or_raise
    end

    # :nodoc:
    private def create_encoder(dst : ImageEncoder) : Bool
      LibBlend2D.blImageCodecCreateEncoder(self, dst).success_or_raise
    end

    # :nodoc:
    private def self.array_assign_built_in_codecs(self_ : Array) : Bool
      LibBlend2D.blImageCodecArrayAssignBuiltInCodecs(self_).success_or_raise
    end

    # :nodoc:
    private def self.add_to_built_in(codec : ImageCodec) : Bool
      LibBlend2D.blImageCodecAddToBuiltIn(codec).success_or_raise
    end

    # :nodoc:
    private def self.remove_from_built_in(codec : ImageCodec) : Bool
      LibBlend2D.blImageCodecRemoveFromBuiltIn(codec).success_or_raise
    end
  end
end
