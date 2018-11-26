/// void menu_render_main(MenuMain, x, y);

var xx=argument1;
var yy=argument2;

d3d_set_projection_ortho(0, 0, CW, CH, 0);

draw_set_color(c_white);
draw_rectangle(0, 0, xx+CW, yy+argument0.element_height, false);
draw_set_color(c_black);
draw_set_font(FDefault12);
draw_set_valign(fa_middle);

for (var i=0; i<ds_list_size(argument0.contents); i++){
    var thing=argument0.contents[| i];
    
    script_execute(thing.render, thing, xx+argument0.element_width*i, yy);
}
