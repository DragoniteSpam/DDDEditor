/// void omu_data_remove(UIThing);

var catch=argument0;

var selection=ui_list_selection(argument0.root.el_list_main);

if (selection>=0){
    var what=argument0.root.selected_data;
    
    instance_activate_object(what);
    instance_destroy(what);
    
    ds_map_clear(argument0.root.el_list_main.selected_entries);
    
    argument0.root.selected_data=noone;
    argument0.root.selected_property=noone;
    
    argument0.root.el_data_name.interactive=false;
    argument0.root.el_list_p.interactive=false;
    argument0.root.el_add_p.interactive=false;
    argument0.root.el_remove_p.interactive=false;
    
    argument0.root.el_property_name.interactive=false;
    argument0.root.el_property_type.interactive=false;
    argument0.root.el_property_type_guid.enabled=false;
    argument0.root.el_property_min.enabled=true;
    argument0.root.el_property_char_limit.enabled=false;
    argument0.root.el_property_max.enabled=true;
    argument0.root.el_property_bits.enabled=false;
    argument0.root.el_property_bit_name.enabled=false;
    argument0.root.el_property_bits_add.enabled=false;
    argument0.root.el_property_bits_remove.enabled=false;
}
