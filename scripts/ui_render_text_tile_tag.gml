/// void ui_render_text_tile_tag(UIText, x, y);

argument0.text="Terrain tag: "+string(ActiveMap.tileset.tags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]);

ui_render_text(argument0, argument1, argument2);
