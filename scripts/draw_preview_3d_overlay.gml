var w=view_wview[view_current];
var h=view_hview[view_current];
var lw=4;

d3d_set_projection_ortho(0, 0, w, h, 0);

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(16, 16, 400, 144, false);
draw_set_alpha(1);

d3d_set_culling(false)
draw_set_color(c_white);

draw_line_width(0, 0, w, 0, lw);
draw_line_width(0, 0, 0, h, lw);
draw_line_width(w-1, 0, w-1, h, lw);
draw_line_width(0, h-1, w, h-1, lw);

draw_set_font(FDefault12Bold);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(32, 32, "Press Escape to close");

if (keyboard_check(vk_shift)){
    draw_text(32, 64, "Up/Down: translate across Z");
    draw_text(32, 80, "Left/Right: rotate around Z");
} else if (keyboard_check(vk_control)){
    draw_text(32, 64, "Up/Down: rotate around Y");
    draw_text(32, 80, "Left/Right: rotate around X");
} else if (keyboard_check(vk_alt)){
    draw_text(32, 64, "Up/Down: scale up/down (all axes)");
} else {
    draw_text(32, 64, "Up/Down: translate across Y");
    draw_text(32, 80, "Left/Right: translate across X");
}

draw_text(32, 112, "Press Backspace to reset");
draw_text(32, 128, "Shift, Control and Alt all do different things");

draw_set_color(c_black);
