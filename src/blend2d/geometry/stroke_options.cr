module Blend2D::Geometry
  class StrokeOptions < Core(LibBlend2D::BLStrokeOptionsCore)
    def initialize(@core : LibBlend2D::BLStrokeOptionsCore)
    end

    def finalize
      LibBlend2D.blStrokeOptionsDestroy(self).success_or_raise
    end
  end
end
