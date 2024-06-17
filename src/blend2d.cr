require "./blend2d/lib_blend2d/*"
require "./blend2d/core"
require "./blend2d/*"
require "./blend2d/generated/*"

module Blend2D
  alias Style = UInt32 | RGBA32 | UInt64 | RGBA64 | Pattern | Gradient

  include Blend2D::Geometry
end
