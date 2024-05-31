module Blend2D
  class ImageCodec
    # :nodoc:
    def initialize
      LibBlend2D.blImageCodecInit(out @core).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blImageCodecReset(self).success_or_raise
    end

    # :nodoc:
    def assign_move(other : ImageCodec) : Bool
      LibBlend2D.blImageCodecAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : ImageCodec) : Bool
      LibBlend2D.blImageCodecAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def find_by_name(name : UInt8*, size : Int32, codecs : Array) : Bool
      LibBlend2D.blImageCodecFindByName(self, name, size, codecs).success_or_raise
    end

    # :nodoc:
    def find_by_extension(name : UInt8*, size : Int32, codecs : Array) : Bool
      LibBlend2D.blImageCodecFindByExtension(self, name, size, codecs).success_or_raise
    end

    # :nodoc:
    def find_by_data(data : Pointer, size : Int32, codecs : Array) : Bool
      LibBlend2D.blImageCodecFindByData(self, data, size, codecs).success_or_raise
    end

    # :nodoc:
    def inspect_data(data : Pointer, size : Int32) : UInt32
      LibBlend2D.blImageCodecInspectData(self, data, size)
    end

    # :nodoc:
    def create_decoder(dst : ImageDecoder) : Bool
      LibBlend2D.blImageCodecCreateDecoder(self, dst).success_or_raise
    end

    # :nodoc:
    def create_encoder(dst : ImageEncoder) : Bool
      LibBlend2D.blImageCodecCreateEncoder(self, dst).success_or_raise
    end

    # :nodoc:
    def self.array_init_built_in_codecs(self_ : Array) : Bool
      LibBlend2D.blImageCodecArrayInitBuiltInCodecs(self_).success_or_raise
    end

    # :nodoc:
    def self.array_assign_built_in_codecs(self_ : Array) : Bool
      LibBlend2D.blImageCodecArrayAssignBuiltInCodecs(self_).success_or_raise
    end

    # :nodoc:
    def self.add_to_built_in(codec : ImageCodec) : Bool
      LibBlend2D.blImageCodecAddToBuiltIn(codec).success_or_raise
    end

    # :nodoc:
    def self.remove_from_built_in(codec : ImageCodec) : Bool
      LibBlend2D.blImageCodecRemoveFromBuiltIn(codec).success_or_raise
    end
  end
end
