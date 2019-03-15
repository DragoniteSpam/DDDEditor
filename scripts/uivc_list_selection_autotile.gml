/// uivc_list_selection_autotile(UIList);

if (ds_map_size(argument0.selected_entries)==1){
    Camera.selection_fill_autotile=ui_list_selection(argument0);
    
    uivc_select_autotile_refresh(/*Camera.selection_fill_autotile*/);
}
