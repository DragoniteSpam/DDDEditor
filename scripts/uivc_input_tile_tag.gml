/// uivc_input_tile_tag(UIInput);

if (script_execute(argument0.validation, argument0.value)){
    var rv=real(argument0.value);
    if (is_clamped(rv, argument0.value_lower, argument0.value_upper)){
        ActiveMap.tileset.tags[# Camera.selection_fill_tile_x, Camera.selection_fill_tile_y]=rv;
    }
}
