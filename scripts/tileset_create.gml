/// DataTileset tileset_create(picture);

// don't instantiate these outside of this script
with (instance_create(0, 0, DataTileset)){
    picture=argument0;
    passage=tileset_create_grid(picture, TILE_PASSABLE);
    priority=tileset_create_grid(picture, 0);
    flags=tileset_create_grid(picture, 0);
    tags=tileset_create_grid(picture, TileTerrainTags.NONE);

    instance_deactivate_object(id);
    return id;
}
