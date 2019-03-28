/// void omu_data_property_remove(UIThing);

var property=argument0.root.selected_property;

if (property!=noone){
    instance_activate_object(property);
    instance_destroy(property);
    
    ds_map_clear(argument0.root.el_list_p.selected_entries);
    ds_list_delete(argument0.root.selected_data.properties,
        ds_list_find_index(argument0.root.selected_data.properties, property));
    
    argument0.root.selected_property=noone;
    
    argument0.root.el_property_name.interactive=false;
    argument0.root.el_property_type.interactive=false;
    argument0.root.el_property_type_guid.enabled=false;
    argument0.root.el_property_min.enabled=false;
    argument0.root.el_property_char_limit.enabled=false;
    argument0.root.el_property_max.enabled=true;
    argument0.root.el_property_bits.enabled=false;
    argument0.root.el_property_bit_name.enabled=false;
    argument0.root.el_property_bits_add.enabled=false;
    argument0.root.el_property_bits_remove.enabled=false;
}
