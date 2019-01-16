/// uivc_bitfield_tile_passability(UIThing);

// you could use ^= but
var longexpr=ActiveMap.tileset.passage[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y];
longexpr=longexpr^argument0.value;

ActiveMap.tileset.passage[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]=longexpr;
