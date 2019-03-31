/// void omu_data_property_set_enum(UIThing);

show_message(argument0.text)
show_message(argument0.root.text)
var data=argument0.root.selected_data;
var property=argument0.root.selected_property;

var list_enum=ds_list_create();

for (var i=0; i<ds_list_size(Stuff.all_data); i++){
    if (Stuff.all_data[| i].is_enum){
        ds_list_add(list_enum, Stuff.all_data[| i]);
    }
}

var list_sorted=ds_list_sort_sucks(list_enum);

var enum_guid=list_sorted[| ui_list_selection(argument0.root.el_list_main)].GUID;

ds_list_destroy(list_guid);
ds_list_destroy(list_sorted);

show_message(guid_get(enum_guid).name)

dc_close_no_questions_asked(argument0.root);
