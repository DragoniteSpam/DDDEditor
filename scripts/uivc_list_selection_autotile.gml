/// uivc_list_selection_autotile(UIList);

if (ds_map_size(argument0.selected_entries)==1){
    Camera.selection_fill_autotile=ds_map_find_first(argument0.selected_entries);
    
    uivc_select_autotile_refresh(Camera.selection_fill_autotile);
}
