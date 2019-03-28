/// void omu_data_remove(UIThing);

var catch=argument0;

var selection=ui_list_selection(argument0.root.el_list_main);

if (selection>=0){
    var sorted=ds_list_sort_name_sucks(Stuff.all_data);
    var what=sorted[| selection];
    ds_list_destroy(sorted);
    
    instance_activate_object(what);
    instance_destroy(what);
    
    ds_map_clear(argument0.root.el_list_main.selected_entries);
    var n=ds_list_size(Stuff.all_data);
    if (n>0){
        ds_map_add(argument0.root.el_list_main.selected_entries, min(n-1, selection), true);
    }
}
