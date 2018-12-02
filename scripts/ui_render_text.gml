/// void ui_render_text(UIText, x, y);

draw_set_halign(argument0.alignment);
draw_set_color(argument0.color);
draw_text_ext(argument0.x+argument1, argument0.y+argument2, argument0.text, -1, argument0.wrap_width);
