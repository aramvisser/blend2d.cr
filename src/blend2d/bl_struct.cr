module Blend2D
  abstract struct BLStruct(T)
    @core : T

    def initialize(@core : T)
    end

    def to_unsafe
      pointerof(@core)
    end
  end
end
