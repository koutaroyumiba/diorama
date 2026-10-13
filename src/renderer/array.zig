const std = @import("std");
const rl = @import("raylib");

pub const ArrayStyle = struct {
    border_width: f32 = 2,
    padding: f32 = 8,
    font_size: i32 = 20,
};

pub fn drawArray(bounds: rl.Rectangle, values: []const i32, style: ArrayStyle) void {
    if (values.len == 0) return;

    const cell_width = bounds.width / @as(f32, @floatFromInt(values.len));
    for (0..values.len) |i| {
        const rect: rl.Rectangle = .{
            .x = bounds.x + (@as(f32, @floatFromInt(i)) * cell_width),
            .y = bounds.y,
            .width = cell_width,
            .height = bounds.height,
        };
        rl.drawRectangleLinesEx(rect, style.border_width, .black);

        const element = rl.textFormat("%d", .{values[i]});
        const w = rl.measureText(element, 20);
        const auto_padding = (cell_width - @as(f32, @floatFromInt(w))) / 2;
        const tmp_x = @as(i32, @intFromFloat(rect.x + auto_padding));
        // rl.drawText(element, @as(i32, @intFromFloat(rect.x + style.padding)), @as(i32, @intFromFloat(rect.y + style.padding)), style.font_size, .black);
        rl.drawText(element, tmp_x, @as(i32, @intFromFloat(rect.y + style.padding)), style.font_size, .black);
    }
}

//         const measured_size = rl.measureText("99999");
//         if (element_width < measured_size) {
//             // handle this case here
//             std.debug.print("{any}", .{measured_size});
//         }
//
//         // i dont think this is the current fn...
//         rl.drawRectangleLines(0, 0, 0, 0, .sky_blue);
//     }
// };
