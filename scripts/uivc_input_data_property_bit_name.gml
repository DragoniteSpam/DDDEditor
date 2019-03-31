/// uivc_input_data_property_bit_name(UIThing);

if (script_execute(argument0.validation, argument0.value)){
    var selection=ui_list_selection(argument0.root.el_property_bits);
    argument0.root.selected_property.bool_list[selection]=argument0.root.el_property_bit_name.value;
}
