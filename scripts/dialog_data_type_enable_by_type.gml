/// void dialog_data_type_enable_by_type(Dialog);
// turns off all of the UI elements associated with properties of data

argument0.el_data_name.interactive=true;
argument0.el_add_p.interactive=true;
argument0.el_remove_p.interactive=true;

argument0.el_property_name.interactive=true;
argument0.el_property_name.value=argument0.selected_property.name;

argument0.el_property_type.interactive=!argument0.selected_data.is_enum;

if (argument0.selected_data.is_enum){
    // nothing special for here
} else {
    argument0.el_property_type.interactive=true;
    
    argument0.el_property_type.value=argument0.selected_property.type;
    
    switch (argument0.selected_property.type){
        case DataTypes.INT:
        case DataTypes.FLOAT:
            argument0.el_property_min.interactive=true;
            argument0.el_property_max.interactive=true;
            argument0.el_property_scale.interactive=true;
            argument0.el_property_min.enabled=true;
            argument0.el_property_max.enabled=true;
            argument0.el_property_scale.enabled=true;
            argument0.el_property_min.value=string(argument0.selected_property.range_min);
            argument0.el_property_max.value=string(argument0.selected_property.range_max);
            argument0.el_property_scale.value=argument0.selected_property.number_scale;
            break;
        case DataTypes.STRING:
            argument0.el_property_char_limit.interactive=true;
            argument0.el_property_char_limit.enabled=true;
            argument0.el_property_char_limit.value=string(argument0.selected_property.char_limit);
            break;
        case DataTypes.BOOL:
            argument0.el_property_bool_note.enabled=true;
            break;
        case DataTypes.BOOL_ARRAY:
            argument0.el_property_bit_name.interactive=true;
            argument0.el_property_bits.interactive=true;
            argument0.el_property_bit_name.enabled=true;
            argument0.el_property_bits.enabled=true;
            argument0.el_property_bit_name.value=string(argument0.selected_property.bool_list[|
                ui_list_selection(argument0.el_property_bits)]);
            break;
        case DataTypes.ENUM:
        case DataTypes.DATA:
            argument0.el_property_type_guid.interactive=true;
            argument0.el_property_type_guid.enabled=true;
            var type=guid_get(argument0.selected_property.type_guid);
            if (type==noone){
                argument0.el_property_type_guid.value="Select";
            } else {
                argument0.el_property_type_guid.value=type.name+" (Select)";
            }
            break;
    }
}