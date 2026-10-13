const std = @import("std");
const rl = @import("raylib");

const array = @import("renderer/array.zig");
const metadata = @import("renderer/metadata.zig");

pub fn main() !void {
    const init_width = 800;
    const init_height = 500;

    rl.setConfigFlags(.{
        .window_topmost = true,
        .window_unfocused = true,
        .window_undecorated = true,
        // use the device refresh rate
        .vsync_hint = true,
    });
    rl.initWindow(init_width, init_height, "diorama");
    defer rl.closeWindow();

    rl.setWindowMinSize(640, 360);
    rl.setWindowPosition(905, 560);

    var counter: u16 = 0;
    var test_array = [_]i32{ 1, 2, 3, 4, 5 };

    var metadata_bounds = rl.Rectangle.init(0, 0, 220, 400);
    const array_bounds = rl.Rectangle.init(250, 30, 200, 36);

    while (!rl.windowShouldClose()) {
        const screen_height: f32 = @floatFromInt(rl.getScreenWidth());
        metadata_bounds.height = screen_height;

        if (counter == 100) {
            for (&test_array) |*el| {
                el.* += 1;
            }
            counter = 0;
        } else {
            counter += 1;
        }

        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);

        metadata.drawMetadata(metadata_bounds);
        array.drawArray(array_bounds, &test_array, .{});
    }
}
