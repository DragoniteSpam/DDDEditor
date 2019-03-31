/// void ui_render_list_data_property_bit(UIList);

var oentries=argument0.entries;
var property=argument0.root.selected_property;

if (property!=noone){
    argument0.entries=array_to_list(property.bool_list);
}

ui_render_list(argument0, argument1, argument2);

if (property!=noone){
    ds_list_destroy(argument0.entries);
    argument0.entries=oentries;
}
