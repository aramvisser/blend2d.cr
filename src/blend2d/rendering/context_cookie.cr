module Blend2D::Rendering
  struct ContextCookie < BLStruct(LibBlend2D::BLContextCookie)
    def initialize(@core : T)
    end
  end
end
