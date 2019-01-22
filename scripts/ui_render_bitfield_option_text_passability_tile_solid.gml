/// void ui_render_bitfield_option_text_passability_tile_solid(UIBitFieldOption, x, y);
// because the usual value&0 won't do what you want it to do

state=ActiveMap.tileset.passage[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]==0;

ui_render_bitfield_option_text(argument0, argument1, argument2);
