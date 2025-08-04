# [zopengl_glgen](https://git.falsepattern.com/falsepattern/zopengl_glgen)

OpenGL type-safe wrapper for Zig, integrated with [zigglgen](https://github.com/castholm/zigglgen).

Based on [zopengl](https://github.com/zig-gamedev/zopengl)

Supports:
* OpenGL Core Profile up to version 4.6
* OpenGL ES up to version 2.0

## Getting started

Example `build.zig`:

```zig
pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{ ... });

    const gl_bindings = @import("zigglgen").generateBindingsModule(b, .{
        .api = .gl,
        .version = .@"4.1",
        .profile = .core,
        .extensions = &.{ .ARB_clip_control, .NV_scissor_exclusive },
    });
    
    const gl_wrapper = @import("zopengl_glgen").createGLWrapperModule(b, gl_bindings);
    exe.root_module.addImport("zgl", gl_wrapper);
}
```

Now in your code you may import and use `zopengl_glgen`:

```zig
const zgl = @import("zgl");

pub fn main() !void {
    // Create window and OpenGL context here... (you can use the zig-gamedev `zsdl` or `zglfw` libs for this)
    // Also initialize the zigglgen proctable

    const gl = zgl.wrapper;

    gl.clearColor(0.2, 0.4, 0.8, 1.0);
    gl.clear(.{.color = true});
}
```
