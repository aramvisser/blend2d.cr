require "../src/blend2d"

img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.fill_all

texture = Blend2D::Image.read_from_file "#{__DIR__}/resources/Leaves.jpeg"
pattern = Blend2D::Pattern.new texture
ctx.fill_geometry Blend2D::RoundRect.new(40, 40, 400, 400, 45.5), pattern

ctx.end
img.write_to_file "#{__DIR__}/patterns.png"
