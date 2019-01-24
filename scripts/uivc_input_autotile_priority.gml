/// uivc_input_autotile_priority(UIThing);

if (ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]!=noone){
    if (script_execute(argument0.validation, argument0.value)){
        var rv=real(argument0.value);
        if (is_clamped(rv, argument0.value_lower, argument0.value_upper)){
            ActiveMap.tileset.at_priority[Camera.selection_fill_autotile]=rv;
        }
    }
}
