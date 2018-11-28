/// void ui_render_tab(UITab);

var x1=argument0.x;
var y1=argument0.y-argument0.height/2;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

draw_line(x1, y1, x2, y1);
draw_line(x1, y1, x1, y2);
draw_line(x2, y1, x2, y2);
if (argument0.root.active_tab!=argument0){
    draw_line(x1, y2, x2, y2);
}

var tx=ui_get_text_x(argument0);
var ty=mean(y1, y2);

draw_set_halign(argument0.alignment);
draw_set_color(argument0.color);
draw_text(tx, ty, argument0.text);

if (mouse_within_rectangle(x1, y1, x2, y2)){
    if (Controller.release_left){
        script_execute(argument0.onmousedown, argument0);
    }
}
