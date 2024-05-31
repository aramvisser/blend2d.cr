module Blend2D
  class StrokeOptions
    # :nodoc:
    def initialize
      LibBlend2D.blStrokeOptionsInit(out @core).success_or_raise
    end

    # :nodoc:
    def finalize
      LibBlend2D.blStrokeOptionsDestroy(self).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blStrokeOptionsReset(self).success_or_raise
    end

    # :nodoc:
    def self.equals(a : StrokeOptions, b : StrokeOptions) : Int32
      LibBlend2D.blStrokeOptionsEquals(a, b)
    end

    # :nodoc:
    def assign_move(other : StrokeOptions) : Bool
      LibBlend2D.blStrokeOptionsAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : StrokeOptions) : Bool
      LibBlend2D.blStrokeOptionsAssignWeak(self, other).success_or_raise
    end
  end
end
