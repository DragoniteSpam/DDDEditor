/// void ui_render_text_autotile_tag(UIText, x, y);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    argument0.text=all_tile_terrain_tag_names[ActiveMap.tileset.at_tags[Camera.selection_fill_autotile]];
}

ui_render_text(argument0, argument1, argument2);
