/// uivc_list_data_data(UIList);

var selection=ui_list_selection(argument0);

if (selection>=0){
    var sorted=ds_list_sort_name_sucks(Stuff.all_data);
    argument0.root.selected_data=sorted[| selection];
    ds_list_destroy(sorted);
    
    argument0.root.el_data_name.interactive=true;
    argument0.root.el_list_p.interactive=true;
    argument0.root.el_add_p.interactive=true;
    argument0.root.el_remove_p.interactive=true;
    
    argument0.root.el_data_name.value=argument0.root.selected_data.name;
}
