require "../src/blend2d"

img = Blend2D::Image.new 480, 480, :prgb32
ctx = Blend2D::Context.new img

ctx.fill_all

path = Blend2D::Path.new
path.move_to 26, 31
path.cubic_to 642, 132, 587, -136, 25, 464
path.cubic_to 882, 404, 144, 267, 27, 31

ctx.comp_op = :src_over
ctx.fill_style = 0xFFFFFFFF_u32
ctx.fill path

ctx.end
img.write_to_file "#{__DIR__}/getting_started.png"
