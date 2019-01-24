/// uivc_bitfield_autotile_flag(UIThing);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    // you could use ^= but
    var longexpr=ActiveMap.tileset.at_flags[Camera.selection_fill_autotile];
    longexpr=longexpr^argument0.value;
    
    ActiveMap.tileset.at_flags[Camera.selection_fill_autotile]=longexpr;
}
