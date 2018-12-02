/// void ui_render_button(UIButton, x, y);

var x1=argument0.x+argument1;
var y1=argument0.y+argument2;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

var tx=ui_get_text_x(argument0, x1, x2);
var ty=mean(y1, y2);

draw_rectangle_colour(x1, y1, x2, y2, c_black, c_black, c_black, c_black, true);

if (dialog_is_active(argument0.root)&&mouse_within_rectangle(x1, y1, x2, y2)){
    draw_rectangle_colour(x1, y1, x2, y2, c_ui, c_ui, c_ui, c_ui, false);
    if (get_release_left()){
        script_execute(argument0.onmouseup, argument0);
    }
}

draw_set_halign(argument0.alignment);
draw_set_color(argument0.color);
draw_text(tx, ty, argument0.text);
