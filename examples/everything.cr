require "../src/blend2d"

BLACK = Blend2D::RGBA32.new 0xff0d1321
WHITE = Blend2D::RGBA32.new 0xffe5e5e5
GRAY = Blend2D::RGBA32.new 0xff787b82

face = Blend2D::FontFace.new "#{__DIR__}/resources/ABeeZee-Regular.ttf"
header_font = Blend2D::Font.new face, 36.0

sections = [
  draw_header(header_font, "Primitive Shapes"),
  draw_primitive_shapes(64, 24),
  draw_header(header_font, "Transformations"),
  draw_transformations(64, 24),
  draw_header(header_font, "Gradients"),
  draw_gradients(64, 24),
  draw_header(header_font, "Stroke Caps"),
  draw_stroke_caps(64, 24),
  draw_header(header_font, "Stroke Joins"),
  draw_stroke_joins(64, 24),
  draw_header(header_font, "Font Metrics"),
  draw_font_metrics(64, 24, face),
]

img_width = sections.map(&.size.w).max
img_height = sections.sum &.size.h

img = Blend2D::Image.new img_width, img_height
ctx = Blend2D::Context.new img

ctx.comp_op = :src_copy
ctx.fill_all BLACK

sections.each do |section|
  ctx.blit_image Blend2D::PointI::ZERO, section
  ctx.translate 0, section.size.h
end

ctx.end
img.write_to_file "#{__DIR__}/everything.png"


def draw_header(font, text)
  img = Blend2D::Image.new 512, 56
  ctx = Blend2D::Context.new img
  ctx.fill_all BLACK

  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  ctx.fill_text Blend2D::Point.new(24, 52), font, text
  ctx.stroke Blend2D::Line.new 12, 54.5, 798, 54.5

  ctx.end
  img
end

def draw_primitive_shapes(size, padding)
  img = Blend2D::Image.new 9 * (size + padding) + padding, 2*size + 3*padding
  ctx = Blend2D::Context.new img
  ctx.fill_all BLACK

  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  box = Blend2D::Box.new 0, 0, size, size
  rect = Blend2D::Rect.new 0, padding/2, size, size - padding
  round_rect = Blend2D::RoundRect.new 0, padding/2, size, size - padding, padding
  ellipse = Blend2D::Ellipse.new size/2, size/2, size/2, (size - padding)/2
  circle = Blend2D::Circle.new size/2, size/2, size/2
  arc = Blend2D::Arc.new size/2, size/2, size/2, size/2, 0, 270 * Math::PI / 180
  chord = Blend2D::Chord.new size/2, size/2, size/2, size/2, 0, 270 * Math::PI / 180
  pie = Blend2D::Pie.new size/2, size/2, size/2, size/2, 0, 270 * Math::PI / 180
  triangle = Blend2D::Triangle.new size/2, 0, 0, size, size, size

  ctx.save_and_restore do
    ctx.translate padding, padding
    ctx.fill_geometry box
    ctx.translate size + padding, 0
    ctx.fill_geometry rect
    ctx.translate size + padding, 0
    ctx.fill_geometry round_rect
    ctx.translate size + padding, 0
    ctx.fill_geometry ellipse
    ctx.translate size + padding, 0
    ctx.fill_geometry circle
    ctx.translate size + padding, 0
    ctx.fill_geometry arc
    ctx.translate size + padding, 0
    ctx.fill_geometry chord
    ctx.translate size + padding, 0
    ctx.fill_geometry pie
    ctx.translate size + padding, 0
    ctx.fill_geometry triangle
  end

  ctx.save_and_restore do
    ctx.stroke_width = 2.0
    ctx.translate padding, size + padding*2
    ctx.stroke box
    ctx.translate size + padding, 0
    ctx.stroke rect
    ctx.translate size + padding, 0
    ctx.stroke round_rect
    ctx.translate size + padding, 0
    ctx.stroke ellipse
    ctx.translate size + padding, 0
    ctx.stroke circle
    ctx.translate size + padding, 0
    ctx.stroke arc
    ctx.translate size + padding, 0
    ctx.stroke chord
    ctx.translate size + padding, 0
    ctx.stroke pie
    ctx.translate size + padding, 0
    ctx.stroke triangle
  end

  img
end

def draw_transformations(size, padding)
  img = Blend2D::Image.new 11*size + padding*3, size + 3*padding
  ctx = Blend2D::Context.new img
  ctx.fill_all BLACK

  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  shape = Blend2D::RoundRect.new 0, 0, size, size, padding/4

  ctx.translate padding, padding * 1.5

  ctx.save_and_restore do
    ctx.fill_geometry shape, GRAY
    ctx.translate padding/2, padding/2
    ctx.fill_geometry shape
  end

  ctx.translate size*2, 0

  ctx.save_and_restore do
    ctx.fill_geometry shape, GRAY
    ctx.rotate 15.0 * Math::PI / 180
    ctx.fill_geometry shape
  end

  ctx.translate size*2, 0

  ctx.save_and_restore do
    ctx.fill_geometry shape, GRAY
    ctx.rotate 30.0 * Math::PI / 180, size/2, size/2
    ctx.fill_geometry shape
  end

  ctx.translate size*2, 0

  ctx.save_and_restore do
    ctx.fill_geometry shape, GRAY
    ctx.translate 0.15 * size, -0.15 * size
    ctx.scale 0.7, 1.3
    ctx.fill_geometry shape
  end

  ctx.translate size*2, 0

  ctx.save_and_restore do
    ctx.fill_geometry shape, GRAY
    ctx.skew 0.4, 0
    ctx.fill_geometry shape
  end

  ctx.translate size*2, 0

  ctx.save_and_restore do
    matrix = Blend2D::Matrix2D.translation(padding, -padding).scale(0.5, 1.3).rotate(30 * Math::PI / 180)

    ctx.fill_geometry shape, GRAY
    ctx.transform matrix
    ctx.fill_geometry shape
  end

  img
end

def draw_gradients(size, padding)
  img = Blend2D::Image.new size*4 + padding*6, size + padding * 3
  ctx = Blend2D::Context.new img
  ctx.fill_all BLACK

  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  rectangle = Blend2D::RoundRect.new 0, 0, size*2, size, padding/4
  circle = Blend2D::Circle.new size/2, size/2, size/2 + padding/2

  linear_gradient = Blend2D::Gradient.linear(0, 0, size*2, 0, :pad)
  linear_gradient.add_stop 0.0, GRAY
  linear_gradient.add_stop 1.0, WHITE

  ctx.translate padding, padding*1.5
  ctx.fill_geometry rectangle, linear_gradient

  radial_gradient = Blend2D::Gradient.radial size/2, size/2, size/2 + padding/2, size/2 + padding/2, size/2 + padding/2
  radial_gradient.add_stop 1.0, GRAY
  radial_gradient.add_stop 0.0, WHITE

  ctx.translate size*2 + padding*2, 0
  ctx.fill_geometry circle, radial_gradient

  conic_gradient = Blend2D::Gradient.conic size/2, size/2, 270 * Math::PI / 180
  conic_gradient.add_stop 0.0, GRAY
  conic_gradient.add_stop 1.0, WHITE

  ctx.translate size + padding*2.5, 0
  ctx.fill_geometry circle, conic_gradient

  img
end

def draw_stroke_caps(size, padding)
  img = Blend2D::Image.new size*7, size + padding*2
  ctx = Blend2D::Context.new img

  ctx.fill_all BLACK
  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  ctx.stroke_width = padding
  ctx.stroke_end_cap = :butt

  path = Blend2D::Path.new
  path.move_to 0, 0
  path.line_to 0, size

  gradient = Blend2D::Gradient.linear 0, size, 0, size/3
  gradient.add_stop 0, BLACK
  gradient.add_stop 1, WHITE

  ctx.translate -padding, padding * 1.5

  %w[butt square round round_rev triangle triangle_rev].each do |cap|
    ctx.translate size, 0
    ctx.stroke_start_cap = Blend2D::StrokeCap.parse(cap)
    ctx.stroke path, gradient
  end

  img
end

def draw_stroke_joins(size, padding)
  img = Blend2D::Image.new size*10 + padding*6, size*2
  ctx = Blend2D::Context.new img

  ctx.fill_all BLACK
  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  ctx.stroke_width = padding

  path = Blend2D::Path.new
  path.move_to 0, size
  path.quad_to size, size/2, size, 0
  path.quad_to size * 2, size/2, size*2, size

  gradient = Blend2D::Gradient.linear 0, size - padding/2, 0, size/3
  gradient.add_stop 0, BLACK
  gradient.add_stop 1, WHITE

  ctx.translate padding, size/2 + padding

  %w[miter_clip miter_bevel miter_round bevel round].each do |join|
    ctx.stroke_join = Blend2D::StrokeJoin.parse(join)
    ctx.stroke path, gradient
    ctx.translate size*2 + padding, 0
  end

  img
end

def draw_font_metrics(size, padding, face)
  img = Blend2D::Image.new size*10 + padding*6, size*2 + padding * 2
  ctx = Blend2D::Context.new img

  ctx.fill_all BLACK
  ctx.fill_style = WHITE
  ctx.stroke_style = WHITE

  font = Blend2D::Font.new face, (size*2).to_f32
  font_metrics = font.metrics

  ctx.translate(padding, size*2)

  [
    -0.5,
    font_metrics.x_height,
    font_metrics.cap_height,
  ].each do |y|
    ctx.stroke Blend2D::Line.new(0.0, -y.to_f64, 600.0, -y.to_f64)
  end

  ctx.stroke Blend2D::Point::ZERO, font, "Blend2D"

  img
end
