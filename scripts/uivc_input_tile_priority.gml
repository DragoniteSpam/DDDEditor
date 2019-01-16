/// uivc_input_tile_priority(UIThing);

if (script_execute(argument0.validation, argument0.value)){
    ActiveMap.tileset.priority[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]=real(argument0.value);
}
