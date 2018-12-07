if (mouse_within_view(view_3d)&&!dialog_exists()){
    control_3d();
}

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
    vertex_submit(ActiveMap.batches_wire[| i], pr_linelist, -1);
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
// also anything else that gets drawn over everything else
d3d_set_depth(1);
vertex_submit(grid, pr_linelist, -1);

d3d_set_culling(false);
for (var i=0; i<ds_list_size(selection); i++){
    var sel=selection[| i];
    script_execute(sel.render, sel);
}
d3d_set_depth(0);
