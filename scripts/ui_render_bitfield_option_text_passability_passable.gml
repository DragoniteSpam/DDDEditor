/// void ui_render_bitfield_option_text_passability_passable(UIBitFieldOption, x, y);

// bitwise has its limits
state=ActiveMap.tileset.passage[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]==TILE_PASSABLE;

ui_render_bitfield_option_text(argument0, argument1, argument2);
