/// void ui_render_bitfield_option_text_passability_autotile_solid(UIBitFieldOption, x, y);
// because the usual value&0 won't do what you want it to do

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    argument0.state=ActiveMap.tileset.at_passage[Camera.selection_fill_autotile]==0;
}

ui_render_bitfield_option_text(argument0, argument1, argument2);
