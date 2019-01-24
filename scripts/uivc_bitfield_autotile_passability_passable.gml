/// uivc_bitfield_autotile_passability_passable(UIThing);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    // value^1111 won't do what i want it to do
    ActiveMap.tileset.at_passage[Camera.selection_fill_autotile]=TILE_PASSABLE;
}
