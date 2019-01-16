/// uivc_bitfield_tile_flag(UIThing);

// you could use ^= but
var longexpr=ActiveMap.tileset.flags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y];
longexpr=longexpr^argument0.value;

ActiveMap.tileset.flags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]=longexpr;
