module Blend2D
  class BLString < Core(LibBlend2D::BLStringCore)
    def initialize(@core : LibBlend2D::BLStringCore)
    end

    def finalize
      LibBlend2D.blStringDestroy(self).success_or_raise
    end

    def to_s
      String.new LibBlend2D.blStringGetData(self)
    end
  end
end
