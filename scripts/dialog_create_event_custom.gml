/// void dialog_create_event_custom(Dialog);

var dw=720;
var dh=540;

// todo cache the custom event and only commit the changes when you're done
var dg=dialog_create(dw, dh, "Custom Event Properties", dialog_default, dc_close_no_questions_asked, argument0);
dg.x=dg.x-32;

// later on this will be a clone; elements on the dialog should check this instead of the permenant one,
// and it should be deleted when the dialog is closed
dg.event=Stuff.all_event_custom[| ui_list_selection(argument0.root.el_list_custom)];

var columns=2;
var ew=(dw-columns*32)/columns;
var eh=24;

var vx1=dw/(columns*2)-16;
var vy1=0;
var vx2=vx1+dw/(columns*2)-16;
var vy2=vy1+eh;

var b_width=128;
var b_height=32;

var spacing=16;
var n_slots=10;

var yy=64;

var el_name=create_input(16, yy, "Name:", ew, eh, null, "", dg.event.name, "Event name", validate_string, ui_value_string, 0, 1, 16, vx1, vy1, vx2, vy2, dg);
yy=yy+el_name.height+spacing;

var yy_top=yy;

var el_list=create_list(16, yy, "Data Types: ", "<no data types>", ew, eh, n_slots, null, false, dg);
dg.el_list=el_list;

yy=yy+ui_get_list_height(el_list)+spacing;

var el_add=create_button(16, yy, "Add Property", ew, eh, fa_center, null, dg);
yy=yy+el_add.height+spacing;

var el_remove=create_button(16, yy, "Remove Property", ew, eh, fa_center, null, dg);

// COLUMN 2
yy=yy_top;
var col2_x=dw/columns+16;

var el_property_name=create_input(col2_x, yy, "Property Name:", ew, eh, null, "", "", "Value name", validate_string, ui_value_string, 0, 1, 12, vx1, vy1, vx2, vy2, dg);
yy=yy+el_property_name.height+spacing;

var el_property_type=create_radio_array(col2_x, yy, "Type:", ew, eh, null, 0, dg);
create_radio_array_options(el_property_type, "Int", "Enum", "Float", "String", "Boolean", "Data");

yy=yy+ui_get_radio_array_height(el_property_type)+spacing;

// data and enum - onmouseup is assigned when the radio button is clicked
var el_property_type_guid=create_button(col2_x, yy, "Select", ew, eh, fa_center, null, dg);
el_property_type_guid.interactive=false;

yy=yy+el_property_type_guid.height+spacing;

var el_property_max=create_input(col2_x, yy, "Max list size:", ew, eh, null, "", "1"/* auto */, "1 - 255", validate_int, ui_value_real, 1, 255, 3, vx1, vy1, vx2, vy2, dg);
yy=yy+el_property_max.height+spacing;

var el_property_all=create_checkbox(col2_x, yy, "All required?", ew, eh, null, "", false/* auto */, dg);
yy=yy+el_property_all.height+spacing;

el_confirm=create_button(dw/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg, HelpPages.AUTOTILES, fa_center);

ds_list_add(dg.contents, el_name, el_list, el_add, el_remove,
    el_property_name, el_property_type, el_property_type_guid, el_property_max, el_property_all,
    el_confirm);

keyboard_string="";

return dg;
