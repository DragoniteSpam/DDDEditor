/// UITileSelector create_tile_selector(x, y, width, height, onvaluechange, root, [help]);

with (instance_create(argument[0], argument[1], UITileSelector)){
    width=argument[2];
    height=argument[3];
    
    onvaluechange=argument[4];
    root=argument[5];
    
    switch (argument_count){
        case 7:
            help=argument[6];
            break;
    }
    
    return id;
}
