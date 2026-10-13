const std = @import("std");

const rl = @import("raylib");

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.setConfigFlags(.{ .window_resizable = true });

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    rl.setTargetFPS(60);
    rl.setWindowMinSize(640, 360);

    // const hehe = [_]u8{ 1, 2, 3, 4, 5 };
    const string = [_][]const u8{ "hello", "world" };

    while (!rl.windowShouldClose()) {
        // TODO: render updates
        _ = rl.getScreenWidth();
        _ = rl.getScreenHeight();

        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);
        rl.drawText("oh yea", 190, 200, 20, .light_gray);

        var x: f32 = 10;
        var x_text: i32 = 10;
        for (string) |value| {
            const rect = rl.Rectangle.init(x, 10, 50, 50);
            rl.drawRectangleLinesEx(rect, 5, .sky_blue);
            var buffer: [10]u8 = undefined;
            const str = try std.mem.printSentinel(buffer[0..], "{s}", .{value}, 0);
            rl.drawText(str, x_text + 15, 25, 20, .light_gray);
            x += 50;
            x_text += 50;
        }
        rl.drawRectangleRec(.{
            .x = 250,
            .y = 300,
            .width = 200,
            .height = 100,
        }, .sky_blue);
    }
}
