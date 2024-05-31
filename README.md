# Blend2D.cr

Crystal bindings to [Blend2D](https://blend2d.com).

## Installation

1. Install [Blend2D](https://blend2d.com/download.html)

2. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     blend2d:
       github: aramvisser/blend2d.cr
   ```

3. Run `shards install`

## Example

This will generate a black circle on a transparent background

```crystal
require "blend2d"

# Create a new image and setup the rendering context
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

# Make the background transparent
ctx.clear_all

# Set the current fill style to black
ctx.comp_op = :src_over
ctx.fill_style = 0xFF000000_u32 # Black in ARGB order

# Fill a circle using the current fill style
circle = Blend2D::Geometry::Circle.new cx: 240, cy: 240, r: 200
ctx.fill circle

ctx.end
img.write_to_file "example.png"
```

See the `examples` directory for more examples.

## Usage

For usage of Blend2D itself, see the [Blend2D
Documentation](https://blend2d.com/doc/) itself.

This binding wraps the Blend2D C Api and mkes it more crystal-like.

- Core classes are available in the Blend2D namespace, e.g. `BLContextCore` is
  `Blend2D::Context`.
- Methods that return a `BLResult` in the C Api throw an exception on error.
- Most methods are overloaded, so long names are not needed. You can use
  `Context#fill` or `Context#stroke` instead of `Context#fillPathD` or
  `Context#strokeFillUtf8TextD`.
- Getter and setter methods are that start with `get` and `set` are directly
  available, e.g. `Context#fill_style=` or `Context#comp_op`.
- Enums are abbreviated and made camelcase, e.g. `COMP_OP_SRC_OVER` is
  `Blend2D::CompOp::SrcOver`.

## Development

Crystal methods were automatically generated from all C api's. They are defined
in the `src/blend2d/generated` directory. Those methods have long names based on the C
call, they are not documented and should only be used as a backup.

These methods work like a todo-list. They should be cleaned up and moved into
the main class eventually.

### Regenerating bindings

The C bindings in `src/blend2d/lib_blend2d/` are automatically generated. Run `support/generate_bindings.cr`
with the path to the `blend2d.h` file to regenerate the bindings:

``` crystal
crystal run support/generate_bindings.cr -- path/to/blend2d/src/blend2d.h
```

## Contributing

1. Fork it (<https://github.com/your-github-user/blend2d.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

- [Aram Visser](https://github.com/aramvisser) - creator and maintainer
- [Voximity](https://github.com/voximity/blend2d-cr) - original Blend2D bindings
