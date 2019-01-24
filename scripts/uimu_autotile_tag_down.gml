/// uimu_autotile_tag_down(UIThing);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    var tt=ActiveMap.tileset.at_tags[Camera.selection_fill_autotile];
    tt=(--tt+TileTerrainTags.FINAL)%TileTerrainTags.FINAL;
    ActiveMap.tileset.at_tags[Camera.selection_fill_autotile]=tt;
    uivc_select_autotile_refresh(Camera.selection_fill_autotile);
}
