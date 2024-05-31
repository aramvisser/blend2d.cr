require "../src/blend2d"

img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.comp_op = :src_copy
ctx.fill_all

radial_gradient = Blend2D::Gradient.radial 180, 180, 180, 180, 180
radial_gradient.add_stop 0.0, 0xFFFFFFFF
radial_gradient.add_stop 1.0, 0xFFFF6F3F # ARGB order
circle = Blend2D::Geometry::Circle.new cx: 180, cy: 180, r: 160

ctx.fill circle, radial_gradient

linear_gradient = Blend2D::Gradient.linear 195, 195, 470, 470
linear_gradient.add_stop 0.0, 0xFFFFFFFF
linear_gradient.add_stop 1.0, 0xFF3F9FFF
round_rect = Blend2D::RoundRect.new x: 195, y: 195, w: 270, h: 270, r: 25

ctx.comp_op = :difference
ctx.fill round_rect, linear_gradient

ctx.end
img.write_to_file "#{__DIR__}/composition.png"
