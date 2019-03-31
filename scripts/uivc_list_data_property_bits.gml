/// uivc_list_data_property_bits(UIList);

var selection=ui_list_selection(argument0);

if (selection>=0){
    argument0.root.el_property_bit_name.value=argument0.root.selected_property.bool_list[selection];
}
