/// void uivc_list_autotile_selector(UIList);

var value=ui_list_selection(argument0);

if (value!=noone){
    value=value-1;
    if (value>=0){
        ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]=value;
        var at_data=Stuff.available_autotiles[value];
        if (is_array(at_data)){
            Camera.ui.t_p_autotile_editor.element_list.entries[| Camera.selection_fill_autotile]=string(Camera.selection_fill_autotile)+". "+at_data[AvailableAutotileProperties.NAME];
        }
    } else {
        ActiveMap.tileset.autotiles[Camera.selection_fill_autotile]=noone;
        Camera.ui.t_p_autotile_editor.element_list.entries[| Camera.selection_fill_autotile]=string(Camera.selection_fill_autotile)+". <none set>";
    }
}
