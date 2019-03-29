/// uivc_list_data_property(UIList);

var selection=ui_list_selection(argument0);

if (selection>=0){
    var sorted=ds_list_sort_name_sucks(argument0.root.selected_data.properties);
    argument0.root.selected_property=sorted[| selection];
    ds_list_destroy(sorted);
    
    dialog_data_type_disable(argument0.root);
    
    argument0.root.el_data_name.interactive=true;
    argument0.root.el_list_p.interactive=true;
    argument0.root.el_add_p.interactive=true;
    argument0.root.el_remove_p.interactive=true;
    
    argument0.root.el_property_name.interactive=true;
    argument0.root.el_property_name.value=argument0.root.selected_property.name;
    
    argument0.root.el_property_type.interactive=!argument0.root.selected_data.is_enum;
    if (!argument0.root.selected_data.is_enum){
        argument0.root.el_property_type.type=argument0.root.selected_property.type;
    }
}
