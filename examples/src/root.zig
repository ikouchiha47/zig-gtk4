const std = @import("std");
const Gtk = @import("gtk4");
const c = Gtk.c;

const ApplicationError = error{ InitFailed, WindowInitFailed };

fn on_activate(app: *Gtk.GtkApplication) !void {
    const widget = Gtk.GtkApplicationWindow.gtk_application_window_new(app) orelse return ApplicationError.WindowInitFailed;
    Gtk.Widget.gtk_window_set_title(widget, "Test App");
    Gtk.Widget.gtk_window_set_default_size(widget, 300, 100);
    Gtk.WidgetDecls.gtk_widget_show(widget);
}

pub fn show(rows: u32, cols: u32) !void {
    std.debug.print("rows: {d}, cols: {d}", .{ rows, cols });
    const app = Gtk.GtkApplication.new("com.zmenu.gtkapp", 0) orelse return ApplicationError.InitFailed;

    on_activate(app);
}
