require "../src/blend2d"

img = Blend2D::Image.new 480, 480, :prgb32
ctx = Blend2D::Context.new img

ctx.fill_all

face = Blend2D::FontFace.new "#{__DIR__}/resources/ABeeZee-Regular.ttf"
font = Blend2D::Font.new face, 50.0

ctx.fill_style = 0xFFFFFFFF_u32
ctx.fill Blend2D::Point.new(60, 80), font, "Hello Blend2D"

ctx.rotate 45.0 * Math::PI / 180.0
ctx.fill Blend2D::Point.new(250, 80), font, "Rotated Text"

ctx.end
img.write_to_file "#{__DIR__}/text_rendering.png"
