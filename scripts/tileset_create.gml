/// DataTileset tileset_create(picture, [autotile0, autotile1, .. autotile15]);

// don't instantiate these outside of this script
with (instance_create(0, 0, DataTileset)){
    picture=argument[0];
    array_clear(autotiles, noone);
    
    for (var i=1; i<min(argument_count, 16); i=i+1){
        autotiles[i-1]=argument[i];
    }
    
    passage=tileset_create_grid(picture, TILE_PASSABLE);
    priority=tileset_create_grid(picture, 0);
    flags=tileset_create_grid(picture, 0);
    tags=tileset_create_grid(picture, TileTerrainTags.NONE);
    
    at_passage=array_create(16);
    at_priority=array_create(16);
    at_flags=array_create(16);
    at_tags=array_create(16);
    
    array_clear(at_passage, TILE_PASSABLE);
    array_clear(at_priority, 0);
    array_clear(at_flags, 0);
    array_clear(at_tags, TileTerrainTags.NONE);
    
    master=tileset_create_master(id);

    instance_deactivate_object(id);
    return id;
}
