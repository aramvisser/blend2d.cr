module Blend2D::Geometry
  class StrokeOptions
    # :nodoc:
    private def initialize
      LibBlend2D.blStrokeOptionsInit(out @core).success_or_raise
    end

    # :nodoc:
    private def reset
      LibBlend2D.blStrokeOptionsReset(self).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : StrokeOptions, b : StrokeOptions) : Int32
      LibBlend2D.blStrokeOptionsEquals(a, b)
    end

    # :nodoc:
    private def assign_move(other : StrokeOptions)
      LibBlend2D.blStrokeOptionsAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : StrokeOptions)
      LibBlend2D.blStrokeOptionsAssignWeak(self, other).success_or_raise
    end
  end
end
