# Read raw image pixels and write them in PPM format: https://en.wikipedia.org/wiki/Netpbm#PPM_example

require "../src/blend2d"

# Create an 8x8 black image with an orange circle
img = Blend2D::Image.new 8, 8, :prgb32
ctx = Blend2D::Context.new img

ctx.fill_all
ctx.fill_geometry Blend2D::Circle.new(4, 4, 3), 0xFFFF8040_u32 # Orangish color in ARGB format

ctx.end

ppm = String.build do |io|
  image_data = img.data

  # PPM Header
  io << "P3\n"
  io << image_data.size.w << " " << image_data.size.h << "\n"
  io << "255\n"

  # Write each pixel with newline between rows
  image_data.pixel_data.each_slice(image_data.size.w) do |row|
    row.each do |pixel|
      write_pixel io, pixel
    end

    io << "\n"
  end
end

puts ppm

# Write the RGB triplet, ignoring the alpha channel
def write_pixel(io, pixel : UInt32)
  # Extract the individual color channels from the pixel
  a = (pixel & 0xFF000000) >> 24
  r = (pixel & 0x00FF0000) >> 16
  g = (pixel & 0x0000FF00) >> 8
  b = (pixel & 0x000000FF)

  # Write each channel, with each value right aligned to make it more readable
  io << r.to_s.rjust(3, ' ') << " "
  io << g.to_s.rjust(3, ' ') << " "
  io << b.to_s.rjust(3, ' ') << " "
end

# Alternatively, you can also get an encoded image as a Bytes slice or written to an IO instance
as_bytes = img.write_to_data(Blend2D::ImageCodec::BMP).to_slice # write_to_data returns a Blend2D::BLArray
as_io = img.write_to_io(IO::Memory.new, Blend2D::ImageCodec::PNG) # write_to_io writes the image to the IO and returns the IO
