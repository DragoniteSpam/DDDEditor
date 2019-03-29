/// void omu_data_property_remove(UIThing);

var property=argument0.root.selected_property;

if (property!=noone){
    instance_activate_object(property);
    instance_destroy(property);
    
    ds_map_clear(argument0.root.el_list_p.selected_entries);
    ds_list_delete(argument0.root.selected_data.properties,
        ds_list_find_index(argument0.root.selected_data.properties, property));
    
    argument0.root.selected_property=noone;
    
    dialog_data_type_disable(argument0.root);
}
