require "./blend2d/lib_blend2d/*"

require "./blend2d/*"
require "./blend2d/object/*"
require "./blend2d/global/*"
require "./blend2d/geometry/*"
require "./blend2d/imaging/*"
require "./blend2d/styling/*"
require "./blend2d/text/*"
require "./blend2d/rendering/*"
require "./blend2d/runtime/*"
require "./blend2d/filesystem/*"

require "./blend2d/generated/*"

module Blend2D
  include Blend2D::Object
  include Blend2D::Global
  include Blend2D::Geometry
  include Blend2D::Imaging
  include Blend2D::Styling
  include Blend2D::Text
  include Blend2D::Rendering
  include Blend2D::Runtime
  include Blend2D::Filesystem
end
