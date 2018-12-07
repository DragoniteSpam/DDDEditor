/// void ui_render_radio_option_text(Button, x, y);

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

var router=8;
var rinner=4;

if (!argument0.interactive){
    draw_circle_colour(tx+16, ty, router, c_ltgray, c_ltgray, true);
}
draw_circle(tx+16, ty, router, true);

if (argument0.parent.value==argument0.value){
    if (!argument0.interactive){
        draw_set_alpha(0.5);
    }
    draw_circle_colour(tx+16, ty, rinner, c_green, c_green, false);
    draw_set_alpha(1);
}

if (argument0.interactive&&dialog_is_active(argument0.root)&&mouse_within_rectangle(x1, y1, x2, y2)){
    if (get_release_left()){
        argument0.parent.value=argument0.value;
        script_execute(argument0.parent.onvaluechange, argument0);
    }
}
