/// void omu_data_remove(UIThing);

var catch=argument0;

var selection=ui_list_selection(argument0.root.el_list_main);

if (selection>=0){
    var what=argument0.root.selected_data;
    
    instance_activate_object(what);
    instance_destroy(what);
    
    ds_map_clear(argument0.root.el_list_main.selected_entries);
    ds_map_clear(argument0.root.el_list_p.selected_entries);
    
    argument0.root.selected_data=noone;
    argument0.root.selected_property=noone;
    
    dialog_data_type_disable(argument0.root);
}
