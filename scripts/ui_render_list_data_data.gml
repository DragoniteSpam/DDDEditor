/// void ui_render_list_data_data(UIList);

var otext=argument0.text;
var oentries=argument0.entries;

argument0.text=otext+string(ds_list_size(Stuff.all_data));
argument0.entries=ds_list_sort_name_sucks(Stuff.all_data);

ui_render_list(argument0, argument1, argument2);

ds_list_destroy(argument0.entries);

argument0.text=otext;
argument0.entries=oentries;
