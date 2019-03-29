/// uivc_list_data_property(UIList);

var selection=ui_list_selection(argument0);

if (selection>=0){
    var sorted=ds_list_sort_name_sucks(argument0.root.selected_data.properties);
    if (sorted[| selection]!=argument0.root.selected_property){
        argument0.root.selected_property=sorted[| selection];
        ds_list_destroy(sorted);
        
        dialog_data_type_disable(argument0.root);
        dialog_data_type_enable_by_type(argument0.root);
    }
    ds_list_destroy(sorted);
}
