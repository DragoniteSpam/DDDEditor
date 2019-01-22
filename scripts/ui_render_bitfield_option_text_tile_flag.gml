/// void ui_render_bitfield_option_text_tile_flag(UIBitFieldOption, x, y);

state=ActiveMap.tileset.flags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]&argument0.value;

ui_render_bitfield_option_text(argument0, argument1, argument2);
