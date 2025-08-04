const std = @import("std");
const zigglgen = @import("zigglgen");
pub fn createGLWrapperModule(b: *std.Build, gl_bindings_module: *std.Build.Module) *std.Build.Module {
    return b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .imports = &.{
            .{ .name = "bindings", .module = gl_bindings_module },
        }
    });
}

pub fn build(_: *std.Build) void {
}
