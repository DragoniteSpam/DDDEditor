/// void ui_render_text(UIText);

draw_set_halign(argument0.alignment);
draw_set_color(argument0.color);
draw_text_ext(argument0.x, argument0.y, argument0.text, -1, argument0.wrap_width);
