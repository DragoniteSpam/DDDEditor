/// void ui_render_bitfield_option_text_passability_autotile_passable(UIBitFieldOption, x, y);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    // bitwise has its limits
    argument0.state=ActiveMap.tileset.at_passage[Camera.selection_fill_autotile]==TILE_PASSABLE;
}

ui_render_bitfield_option_text(argument0, argument1, argument2);
