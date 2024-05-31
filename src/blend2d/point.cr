module Blend2D
  struct Point < BLStruct(LibBlend2D::BLPoint)
    ZERO = new(0, 0)

    delegate :x, :y, to: @core

    def initialize(x : Float64, y : Float64)
      @core = LibBlend2D::BLPoint.new x: x, y: y
    end
  end

  struct PointI < BLStruct(LibBlend2D::BLPoint)
    ZERO = new(0, 0)

    delegate :x, :y, to: @core

    def initialize(x : Int32, y : Int32)
      @core = LibBlend2D::BLPointI.new x: x, y: y
    end
  end
end
