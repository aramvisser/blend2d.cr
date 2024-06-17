require "../src/blend2d"

img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.fill_all

texture = Blend2D::Image.read_from_file "#{__DIR__}/resources/Leaves.jpeg"
pattern = Blend2D::Pattern.new texture

angle = 45.0 * Math::PI / 180.0
ctx.rotate angle, 240.0, 240.0

ctx.fill_geometry Blend2D::RoundRect.new(50, 50, 380, 380, 80.5), pattern

ctx.end
img.write_to_file "#{__DIR__}/transformations.png"
