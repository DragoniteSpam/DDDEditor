/// EntityTile instance_create_tile(tile x, tile y, [other parameters that should be dealt with later]);

with (instance_create(0, 0, EntityTile)){
    switch (argument_count){
        case 2:
            tile_y=argument[1];
            tile_x=argument[0];
            break;
    }
    
    cobject=c_object_create(Stuff.c_shape_tile, 1, 1);
    return id;
}
