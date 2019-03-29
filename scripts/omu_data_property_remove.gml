/// void omu_data_property_remove(UIThing);

var data=argument0.root.selected_data;
var property=argument0.root.selected_property;

if (property!=noone){
    // remove the property from each of the instances of the data
    var index=ds_list_find_index(data.properties, property);
    
    for (var i=0; i<ds_list_size(data.instances); i++){
        var inst=data.instances[| i];
        ds_list_delete(inst, index);
    }
    
    // delete the actual instance
    instance_activate_object(property);
    instance_destroy(property);
    
    ds_map_clear(argument0.root.el_list_p.selected_entries);
    ds_list_delete(argument0.root.selected_data.properties,
        ds_list_find_index(argument0.root.selected_data.properties, property));
    
    // you could try to calculate what should be newly selected but that's a lot of work
    // that i don't feel like doing
    argument0.root.selected_property=noone;
    
    dialog_data_type_disable(argument0.root);
}
