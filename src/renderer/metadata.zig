const std = @import("std");
const rl = @import("raylib");

pub fn drawMetadata(bounds: rl.Rectangle) void {
    // draw the border first
    rl.drawRectangleLinesEx(bounds, 2, .black);

    const monitor = rl.getCurrentMonitor();

    const res_text = rl.textFormat("Res: %ipx x %ipx", .{
        rl.getMonitorWidth(monitor),
        rl.getMonitorHeight(monitor),
    });
    const frame_text = rl.textFormat("Elapsed:  %02.02f ms", .{rl.getFrameTime() * 1000});

    var x_int: i32 = @intFromFloat(bounds.x);
    var y_int: i32 = @intFromFloat(bounds.y);
    x_int += 10;
    y_int += 10;

    rl.drawText("Metadata:", x_int, y_int, 20, .red);
    y_int += 30;
    rl.drawFPS(x_int, y_int);
    y_int += 25;
    rl.drawText(res_text, x_int, y_int, 20, .black);
    y_int += 25;
    rl.drawText(frame_text, x_int, y_int, 20, .black);
}
