/// void ui_render_radio_array(Button, x, y);

var x1=argument0.x+argument1;
var y1=argument0.y+argument2;
var x2=x1+argument0.width;
var y2=y1+argument0.height*(1+ds_list_size(argument0.contents));

var tx=ui_get_text_x(argument0, x1, x2);
var ty=ui_get_text_y(argument0, y1, y1+argument0.height);

draw_rectangle_colour(x1, y1, x2, y2, c_black, c_black, c_black, c_black, true);

draw_set_halign(argument0.alignment);
draw_set_valign(argument0.valignment);
draw_set_color(argument0.color);
draw_text(tx, ty, argument0.text);

for (var i=0; i<ds_list_size(argument0.contents); i++){
    var thing=argument0.contents[| i];
    script_execute(thing.render, thing, x1, y1);
}
