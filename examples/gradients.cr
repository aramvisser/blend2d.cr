require "../src/blend2d"

img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.fill_all

linear_gradient = Blend2D::Gradient.linear(0, 0, 0, 480, :pad)
linear_gradient.add_stop 0.0, 0xFFFFFFFF_u32
linear_gradient.add_stop 0.5, Blend2D::RGBA32.new(r: 95, g: 175, b: 223)
linear_gradient.add_stop 1.0, 0xFF2F5FDF_u32 # ARGB order

ctx.fill_round_rect 40, 40, 400, 400, 45.5, linear_gradient

ctx.end
img.write_to_file "#{__DIR__}/gradients.png"
