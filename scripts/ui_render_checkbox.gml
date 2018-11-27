/// void ui_render_checkbox(Button);

var x1=argument0.x;
var y1=argument0.y;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

var tx=ui_get_text_x(argument0);
var ty=mean(y1, y2);

// this is not quite the same as ui_render_text
draw_set_halign(argument0.alignment);
draw_set_color(argument0.color);
draw_text(tx+32, ty, argument0.text);

var s2=8;

draw_rectangle(argument0.x+16-s2, ty-s2, argument0.x+16+s2, ty+s2, true);

if (argument0.value){
    draw_sprite(spr_check, 0, argument0.x+16, ty);
}

if (mouse_within_rectangle(x1, y1, x2, y2)){
    if (Controller.release_left){
        argument0.value=!argument0.value;
        script_execute(argument0.onvaluechange, argument0.value);
    }
}
