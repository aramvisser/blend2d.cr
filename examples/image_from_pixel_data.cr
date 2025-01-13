require "../src/blend2d"

# Blend2D expects a byte to be in ARGB order
def argb32_pixel(r : UInt8, g : UInt8, b : UInt8, a : UInt8 = 255)
  b.to_u32 | (g.to_u32 << 8) | (r.to_u32 << 16) | (a.to_u32 << 24)
end

WIDTH = 256
HEIGHT = 256

pixels = Slice(UInt32).new(WIDTH * HEIGHT)

HEIGHT.times do |y|
  WIDTH.times do |x|
    pixels[y * HEIGHT + x] = argb32_pixel(r: x.to_u8, g: y.to_u8, b: 255_u8)
  end
end

image = Blend2D::Image.new WIDTH, HEIGHT, Blend2D::Format::Xrgb32, pixels
image.write_to_file "#{__DIR__}/image_from_pixel_data.png"
