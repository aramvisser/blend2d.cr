module Blend2D
  struct Size < BLStruct(LibBlend2D::BLSize)
    delegate :w, :h, to: @core

    def initialize(w : Float64, h : Float64)
      @core = LibBlend2D::BLSize.new w: w, h: h
    end
  end

  struct SizeI < BLStruct(LibBlend2D::BLSizeI)
    ZERO = new(0, 0)

    delegate :w, :h, to: @core

    def initialize(@core : T)
    end

    def initialize(w : Int32, h : Int32)
      @core = LibBlend2D::BLSizeI.new w: w, h: h
    end
  end
end
