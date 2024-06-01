require "../src/blend2d"

img = Blend2D::Image.new 836, 128
ctx = Blend2D::Context.new img

ctx.comp_op = :src_copy
ctx.fill_all

ctx.fill_style = 0xFFFFFFFF_u32
ctx.save

ctx.translate 32, 32

rect = Blend2D::Box.new(0, 0, 128, 64)
ctx.fill rect
ctx.translate 160, 0

box = Blend2D::Box.new(0, 0, 64, 64)
ctx.fill box
ctx.translate 92, 0

round_rect = Blend2D::RoundRect.new(0, 0, 64, 64, 16)
ctx.fill round_rect
ctx.translate 92, 0

circle = Blend2D::Circle.new(32, 32, 32)
ctx.fill circle
ctx.translate 92, 0

ellipse = Blend2D::Ellipse.new(32, 32, 32, 24)
ctx.fill ellipse
ctx.translate 92, 0

arc = Blend2D::Arc.new(32, 32, 32, 24, 0, 270 * Math::PI / 180)
ctx.fill arc
ctx.translate 92, 0

pie = Blend2D::Pie.new(32, 32, 32, 24, 0, 270 * Math::PI / 180)
ctx.fill pie
ctx.translate 92, 0

triangle = Blend2D::Triangle.new(32, 0, 0, 64, 64, 64)
ctx.fill triangle
ctx.translate 92, 0

ctx.restore

ctx.stroke_style = Blend2D::RGBA32.new(128, 128, 128)
top_line = Blend2D::Line.new(0, 32.5, 836, 32.5)
bottom_line = Blend2D::Line.new(0, 96.5, 836, 96.5)
ctx.stroke top_line
ctx.stroke bottom_line

ctx.end
img.write_to_file "#{__DIR__}/geometry.png"
