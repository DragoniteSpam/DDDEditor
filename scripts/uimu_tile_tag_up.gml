/// uimu_tile_tag_up(UIThing);

var tt=ActiveMap.tileset.tags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y];
tt=++tt%TileTerrainTags.FINAL;
ActiveMap.tileset.tags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]=tt;
uivc_select_tile_refresh(Camera.selection_fill_tile_x, Camera.selection_fill_tile_y);
