/// uivc_bitfield_autotile_passability_solid(UIThing);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    // value^0 won't do what i want it to do
    ActiveMap.tileset.at_passage[Camera.selection_fill_autotile]=0;
}
