require "../src/blend2d"

img = Blend2D::Image.new 480, 480, :prgb32
ctx = Blend2D::Context.new img

ctx.comp_op = :src_copy
ctx.fill_all

linear_gradient = Blend2D::Gradient.linear 0, 0, 0, 480
linear_gradient.add_stop 0.0, 0xFFFFFFFF_u32
linear_gradient.add_stop 0.5, 0xFFFF1F7F_u32 # ARGB order
linear_gradient.add_stop 1.0, 0xFF1F7FFF_u32

path = Blend2D::Path.new
path.move_to 119, 49
path.cubic_to 259, 29, 99, 279, 275, 267
path.cubic_to 537, 245, 300, -170, 274, 430

ctx.stroke_width = 15
ctx.stroke_start_cap = :round
ctx.stroke_end_cap = :butt

ctx.stroke path, linear_gradient

ctx.end
img.write_to_file "#{__DIR__}/stroking.png"
