/// DataTileset tileset_create(picture, [autotileID0, autotileID1, .. autotileID15]);

// don't instantiate these outside of this script
with (instance_create(0, 0, DataTileset)){
    picture=argument[0];
    array_clear(autotiles, noone);
    
    // these should be indices in Stuff.available_autotiles, not the
    // sprite asset itself!
    for (var i=1; i<min(argument_count, AUTOTILE_MAX); i=i+1){
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
    
    // don't do uivc_select_autotile_refresh here, the UI hasn't been created yet

    instance_deactivate_object(id);
    return id;
}
