/// void ui_render_bitfield_option_autotext_tile_flag(UIBitFieldOption, x, y);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    argument0.state=ActiveMap.tileset.at_flags[Camera.selection_fill_autotile]&argument0.value;
}

ui_render_bitfield_option_text(argument0, argument1, argument2);
