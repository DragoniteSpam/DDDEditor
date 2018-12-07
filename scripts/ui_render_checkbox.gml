/// void ui_render_checkbox(Button, x, y);

var x1=argument0.x+argument1;
var y1=argument0.y+argument2;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

var tx=ui_get_text_x(argument0, x1, x2);
var ty=ui_get_text_y(argument0, y1, y2);

// this is not quite the same as ui_render_text
draw_set_halign(argument0.alignment);
draw_set_valign(argument0.valignment);
draw_set_color(argument0.color);
draw_text(tx+32, ty, argument0.text);

var s2=8;

draw_rectangle(tx+16-s2, ty-s2, tx+16+s2, ty+s2, true);

if (argument0.value){
    draw_sprite(spr_check, 0, tx+16, ty);
}

if (dialog_is_active(argument0.root)&&mouse_within_rectangle(x1, y1, x2, y2)){
    if (get_release_left()){
        script_execute(argument0.onvaluechange, argument0);
    }
}
