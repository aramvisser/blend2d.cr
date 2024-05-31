require "../src/blend2d"

text = <<-TEXT
  Hello Blend2D!
  I'm a simple multiline text example
  that uses GlyphBuffer and GlyphRun!
  TEXT

img = Blend2D::Image.new 480, 480, :prgb32
ctx = Blend2D::Context.new img

ctx.comp_op = :src_copy
ctx.fill_all

face = Blend2D::FontFace.new "#{__DIR__}/resources/ABeeZee-Regular.ttf"
font = Blend2D::Font.new face, 20.0
font_metrics = font.metrics

buffer = Blend2D::GlyphBuffer.new
y = 190 + font_metrics.ascent

text.lines.each do |line|
  buffer.text = line
  font.shape buffer
  text_metrics = font.text_metrics buffer

  text_width = text_metrics.bounding_box.x1 - text_metrics.bounding_box.x0
  starting_point = Blend2D::Point.new((480 - text_width) / 2, y)

  ctx.fill starting_point, font, buffer.glyph_run, 0xFFFFFFFF_u32

  y += font_metrics.ascent + font_metrics.descent + font_metrics.line_gap
end

ctx.end
img.write_to_file "#{__DIR__}/glyph_buffer.png"
