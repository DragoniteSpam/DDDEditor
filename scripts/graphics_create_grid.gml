with (Camera){
    if (grid!=noone){
        vertex_delete_buffer(grid);
    }
    
    grid=vertex_create_buffer();
    
    vertex_begin(grid, vertex_format_line);
    
    for (var i=0; i<=ActiveMap.xx; i++){
        vertex_point_line(grid, i*Stuff.tile_width, 0, 0, c_white, 1);
        vertex_point_line(grid, i*Stuff.tile_width, ActiveMap.yy*Stuff.tile_height, 0, c_white, 1);
    }
    
    for (var i=0; i<=ActiveMap.yy; i++){
        vertex_point_line(grid, 0, i*Stuff.tile_height, 0, c_white, 1);
        vertex_point_line(grid, ActiveMap.xx*Stuff.tile_width, i*Stuff.tile_height, 0, c_white, 1);
    }
    
    vertex_end(grid);
    vertex_freeze(grid);
}
