module Blend2D
  struct RGBA32
    getter packed : UInt32

    def initialize(@packed : UInt32)
    end

    def initialize(r : UInt8, g : UInt8, b : UInt8, a : UInt8 = UInt8::MAX)
      @packed = b.to_u32 | (g.to_u32 << 8) | (r.to_u32 << 16) | (a.to_u32 << 24)
    end
  end

  struct RGBA64
    getter packed : UInt64

    def initialize(@packed : UInt64)
    end

    def initialize(r : UInt16, g : UInt16, b : UInt16, a : UInt16 = UInt16::MAX)
      @packed = b.to_u64 | (g.to_u64 << 16) | (r.to_u64 << 32) | (a.to_u64 << 48)
    end
  end

  struct RGBA < BLStruct(LibBlend2D::BLRgba)
    delegate :r, :g, :b, :a, to: @core

    def initialize(@core : LibBlend2D::BLRgba)
    end
  end
end
