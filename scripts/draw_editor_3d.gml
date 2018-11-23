d3d_start();
d3d_set_culling(true);
d3d_set_hidden(true);

// todo GMS2 requires smooth shading to be handled by the shader(s) now,
// so to make porting this to GMS2 as pain-free as possible I'd like to
// do it that way here at some point in the future too

draw_set_color(c_white);

d3d_set_projection_ext(x, y, z,
    xto, yto, zto,
    xup, yup, zup,
    fov, CW/CH, 1, 32000);

// anything in the world

// this will need to be dynamic at some point
var tex=sprite_get_texture(b_tileset_overworld, 0);
for (var i=0; i<ds_list_size(ActiveMap.batches); i++){
    vertex_submit(ActiveMap.batches[| i], pr_trianglelist, tex);
}
for (var i=0; i<ds_list_size(ActiveMap.batch_in_the_future); i++){
    var ent=ActiveMap.batch_in_the_future[| i];
    script_execute(ent.render, ent);
}
for (var i=0; i<ds_list_size(ActiveMap.dynamic); i++){
    var ent=ActiveMap.dynamic[| i];
    script_execute(ent.render, ent);
}

// the grid, which you may want an option to turn this off if it gets annoying
// also anything else that gets drawn independently of the z buffer
d3d_set_zwriteenable(false);
vertex_submit(grid, pr_linelist, -1);

d3d_set_culling(false);
if (!selection_empty()){
    transform_set(0, 0, selection_start[vec3.zz]*Stuff.tile_depth, 0, 0, 0, 1, 1, 1);
    
    var x1=selection_start[vec3.xx]*Stuff.tile_width;
    var y1=selection_start[vec3.yy]*Stuff.tile_height;
    var x2=selection_end[vec3.xx]*Stuff.tile_width;
    var y2=selection_end[vec3.yy]*Stuff.tile_height;
    var w=12;
    
    draw_line_width_colour(x1, y1, x1, y2, w, c_red, c_red);
    draw_line_width_colour(x1, y1, x2, y1, w, c_red, c_red);
    draw_line_width_colour(x2, y1, x2, y2, w, c_red, c_red);
    draw_line_width_colour(x1, y2, x2, y2, w, c_red, c_red);
    transform_reset();
}
d3d_set_zwriteenable(true);
