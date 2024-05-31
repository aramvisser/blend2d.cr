module Blend2D
  abstract class Core(T)
    @core = uninitialized T

    def initialize(@core : T)
    end

    def to_unsafe
      pointerof(@core)
    end
  end
end
