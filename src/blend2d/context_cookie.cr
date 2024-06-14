module Blend2D
  struct ContextCookie < BLStruct(LibBlend2D::BLContextCookie)
    def initialize(@core : T)
    end
  end
end
