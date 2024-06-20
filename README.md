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
ctx.fill_style = Blend2D::RGBA32.new(0, 0, 0)

# Fill a circle using the current fill style
ctx.fill_circle cx: 240, cy: 240, r: 200

ctx.end
img.write_to_file "example.png"
```

See the `examples` directory for more examples.

## Usage

For usage of Blend2D itself, see the [Blend2D
Documentation](https://blend2d.com/doc/) itself.

This binding wraps the Blend2D C Api, but tries to follow the Blend2D C++ api design.

- Core classes are available in the Blend2D namespace, e.g. `BLContextCore` is
  `Blend2D::Context`.
- Enums are abbreviated and made camelcase, e.g. `COMP_OP_SRC_OVER` is
  `Blend2D::CompOp::SrcOver`.
  
It also does things differently to make them more crystal like.

- Methods that return a `BLResult` in the C Api either return `true` or throw an
  exception on error.
- Getter and setter methods that start with `get` and `set` act like accessors,
  i.e. `Context#fill_style=` or `Context#comp_op`.
  
The bindings are split into different modules that are also used in the Blend2D
docs, like Imaging, Rendering, etc. This is only done to make things more
organized. All modules are included directly in the `Blend2D` namespace. The
different submodules are not needed during usage.

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
