/// void ui_render_image_button(UIImageButton, x, y);

var x1=argument0.x+argument1;
var y1=argument0.y+argument2;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

var tx=ui_get_text_x(argument0, x1, x2);
var ty=ui_get_text_y(argument0, y1, y2);

if (argument0.interactive){
    var c=c_white;
} else {
    var c=c_ltgray;
}
draw_rectangle_colour(x1, y1, x2, y2, c, c, c, c, false);
draw_rectangle_colour(x1, y1, x2, y2, c_black, c_black, c_black, c_black, true);

var color=c_white;
if (argument0.interactive&&dialog_is_active(argument0.root)){
    if (mouse_within_rectangle(x1, y1, x2, y2)){
        draw_rectangle_colour(x1, y1, x2, y2, c_ui, c_ui, c_ui, c_ui, false);
        color=merge_color(c_white, c_ui, 0.5);
        if (get_release_left()){
            script_execute(argument0.onmouseup, argument0);
        } else if (Controller.press_help){
            //ds_stuff_help_auto(argument0);
        }
    }
}

if (argument0.image==noone){
    draw_set_halign(argument0.alignment);
    draw_set_valign(argument0.valignment);
    draw_set_color(argument0.color);
    draw_text(tx, ty, argument0.text);
} else {
//    draw_sprite(argument0.image, 0, x1, y1);
    draw_sprite_general(argument0.image, 0, 0, 0, min(argument0.width, sprite_get_width(argument0.image)),
        min(argument0.height, sprite_get_height(argument0.image)), x1, y1, 1, 1, 0, color, color, color, color, 1);
}
