transform_set(0, 0, argument0.z*Stuff.tile_depth, 0, 0, 0, 1, 1, 1);

var x1=argument0.x*Stuff.tile_width;
var y1=argument0.y*Stuff.tile_height;
var x2=(argument0.x+1)*Stuff.tile_width;
var y2=(argument0.y+1)*Stuff.tile_height;

var w=12;

draw_line_width_colour(x1, y1, x1, y2, w, c_red, c_red);
draw_line_width_colour(x1, y1, x2, y1, w, c_red, c_red);
draw_line_width_colour(x2, y1, x2, y2, w, c_red, c_red);
draw_line_width_colour(x1, y2, x2, y2, w, c_red, c_red);
transform_reset();
