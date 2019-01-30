/// EntityAutoTile instance_create_autotile(autotile index, [other parameters that should be dealt with later]);

with (instance_create(0, 0, EntityAutoTile)){
    switch (argument_count){
        case 1:
            autotile_id=argument[0];
            break;
    }
    
    cobject=c_object_create(Stuff.c_shape_tile, 1, 1);
    return id;
}
