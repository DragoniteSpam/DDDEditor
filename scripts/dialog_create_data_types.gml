/// void dialog_create_data_types(Dialog);

var dw=960;
var dh=640;

var dg=dialog_create(dw, dh, "Data: Data", dialog_default, dc_close_no_questions_asked, argument0);
dg.x=dg.x-32;

var columns=3;
var ew=(dw-columns*32)/columns;
var eh=24;

var vx1=dw/(columns*2)-16;
var vy1=0;
var vx2=vx1+dw/(columns*2)-16;
var vy2=vy1+eh;

var b_width=128;
var b_height=32;

var spacing=16;
var n_slots=16;

var yy=64;

var el_list=create_list(16, yy, "Data Types: ", "<no data types>", ew, eh, n_slots, null, false, dg);
el_list.render=ui_render_list_data_data;
el_list.entries_are=ListEntries.INSTANCES;

dg.el_list_main=el_list;

yy=yy+el_list.height*el_list.slots+el_list.height+spacing;

el_add=create_button(16, yy, "Add Data", ew, eh, fa_center, omu_data_add, dg);
yy=yy+el_add.height+spacing;

el_remove=create_button(16, yy, "Remove Data", ew, eh, fa_center, omu_data_remove, dg);

yy=64;
var col2_x=dw/3+16;

var el_list_p=create_list(col2_x, yy, "Properties: ", "<no properties>", ew, eh, n_slots, null, false, dg);
el_list_p.interactive=false;
dg.el_list_p=el_list_p;

yy=yy+el_list.height*el_list.slots+el_list.height+spacing;

var el_add_p=create_button(col2_x, yy, "Add Property", ew, eh, fa_center, omu_data_add, dg);
el_add_p.interactive=false;
dg.el_add_p=el_add_p;

yy=yy+el_add_p.height+spacing;

var el_remove_p=create_button(col2_x, yy, "Remove Property", ew, eh, fa_center, omu_data_remove, dg);
el_remove_p.interactive=false;
dg.el_remove_p=el_remove_p;

yy=64;
var col3_x=dw*2/3+16;

var el_property_name=create_input(col3_x, yy, "Name:", ew, eh, null, "", "", "Unique name", validate_string, ui_value_string, 0, 1, 16, vx1, vy1, vx2, vy2, dg);
el_property_name.interactive=false;
dg.el_property_name=el_property_name;

yy=yy+el_property_name.height+spacing;

var el_property_type=create_radio_array(col3_x, yy, "Type:", ew, eh, null, 0, dg);
el_property_type.interactive=false;
create_radio_array_options(el_property_type, "Int", "Enum", "Float", "String", "Boolean", "Boolean Array", "Data");
dg.el_property_type=el_property_type;

yy=yy+ui_get_radio_array_height(el_property_type)+spacing;

var el_text=create_text(col3_x, yy, "Parameters:", ew, eh, fa_left, ew, dg);

yy=yy+el_text.height+spacing;

// data only
var el_property_type_guid=create_button(col3_x, yy, "Data", ew, eh, fa_center, null, dg);
el_property_type_guid.enabled=false;
dg.el_property_type_guid=el_property_type_guid;

// number only
var el_property_min=create_input(col3_x, yy, "Min. Value:", ew, eh, null, "", "0", "", validate_double, ui_value_real, -1<<31, 1<<3-1, 10, vx1, vy1, vx2, vy2, dg);
el_property_min.enabled=true;
dg.el_property_min=el_property_min;

// string only
var el_property_char_limit=create_input(col3_x, yy, "Char. Limit:", ew, eh, null, "", "20", "", validate_int, ui_value_real, 1, 1<<16-1, 5, vx1, vy1, vx2, vy2, dg);
el_property_char_limit.enabled=false;
dg.el_property_char_limit=el_property_char_limit;

yy=yy+eh+spacing;

// number only
var el_property_max=create_input(col3_x, yy, "Max. Value:", ew, eh, null, "", "0", "", validate_double, ui_value_real, -1<<31, 1<<3-1, 10, vx1, vy1, vx2, vy2, dg);
el_property_max.enabled=true;
dg.el_property_max=el_property_max;

// bool array only
var el_property_bits=create_list(col2_x, yy, "Bits:", "<no bits>", ew, eh, 8, null, false, dg);
el_property_bits.enabled=false;
dg.el_property_bits=el_property_bits;

yy=yy+ui_get_radio_array_height(el_property_bits)+spacing;

var el_property_bit_name=create_input(col3_x, yy, "Bit Character:", ew, eh, null, "", "", "One char", validate_string, ui_value_string, 0, 1, 1, vx1, vy1, vx2, vy2, dg);
el_property_bit_name.enabled=false;
dg.el_property_bit_name=el_property_bit_name;

yy=yy+el_property_bit_name.height+spacing;

var el_property_bits_add=create_button(col2_x, yy, "Add Property", ew, eh, fa_center, null, dg);
el_property_bits_add.enabled=false;
dg.el_property_bits_add=el_property_bits_add;

yy=yy+el_property_bits_add.height+spacing;

var el_property_bits_remove=create_button(col2_x, yy, "Remove Property", ew, eh, fa_center, null, dg);
el_property_bits_remove.enabled=false;
dg.el_property_bits_remove=el_property_bits_remove;

yy=yy+el_property_bits_remove.height+spacing;

el_confirm=create_button(dw/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg, HelpPages.AUTOTILES, fa_center);

ds_list_add(dg.contents, el_list, el_add, el_remove,
    el_list_p, el_add_p, el_remove_p,
    el_property_name, el_property_type, el_text,
    el_property_type_guid, el_property_min, el_property_char_limit,
    el_property_max, el_property_bits,
    el_property_bit_name, el_property_bits_add, el_property_bits_remove,
    el_confirm);

keyboard_string="";

return dg;
