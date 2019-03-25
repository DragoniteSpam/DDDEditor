/// void dialog_create_entity_event_page(Dialog);

var dw=640;
var dh=672;

// you can assume that this is valid data because this won't be called otherwise
var index=ui_list_selection(Camera.ui.element_entity_events);
var list=selection_all();
var entity=list[| 0];
var page=entity.object_events[| index];
var dg=dialog_create(dw, dh, "Event Page: "+page.name, dialog_default, dc_settings_map, argument0);
ds_list_destroy(list);

// three columns!
var columns=2;
var ew=(dw-columns*32)/columns;
var eh=24;

var c2=dw/columns;

var vx1=dw/(columns*2)-16;
var vy1=0;
var vx2=vx1+dw/(columns*2)-16;
var vy2=vy1+eh;

var yy=64;
var spacing=16;
var ucheck_width=64;        // unlabeled check boxes shouldn't have as wide of a hitbox

var el_name=create_input(16, yy, "Name:", ew, eh, uivc_entity_event_name, "", page.name, "Name of the event", validate_string, ui_value_string, 0, 1, 16, vx1-64, vy1, vx2, vy2, dg);
yy=yy+eh+spacing;
var el_enabled=create_checkbox(16, yy, "Enabled", ew, eh, uivc_entity_event_enable, "", page.enabled, dg);
yy=yy+eh+spacing;
var el_condition=create_text(16, yy, "Conditions", ew, eh, fa_left, ew, dg);
yy=yy+eh+spacing;

var el_condition_switch_global_enabled=create_checkbox(16, yy, "", ucheck_width, eh, uivc_entity_event_enable_switch_global, "", page.condition_switch_global_enabled, dg);
var el_condition_switch_global=create_button(16+64, yy, "Global Switch", ew-64, eh, fa_center, null, dg);
yy=yy+eh+spacing;
// variable properties go in the form that pops up when you click the button
var el_condition_variable_global_enabled=create_checkbox(16, yy, "", ucheck_width, eh, uivc_entity_event_enable_variable_global, "", page.condition_variable_global_enabled, dg);
var el_condition_variable_global=create_button(16+64, yy, "Global Variable", ew-64, eh, fa_center, null, dg);
yy=yy+eh+spacing;

var el_condition_switch_self_enabled=create_checkbox(16, yy, "", ucheck_width, eh, uivc_entity_event_enable_switch_self, "", page.condition_switch_self_enabled, dg);
var el_condition_switch_self=create_button(16+64, yy, "Self Switch", ew-64, eh, fa_center, null, dg);
yy=yy+eh+spacing;
// variable properties go in the form that pops up when you click the button
var el_condition_variable_self_enabled=create_checkbox(16, yy, "", ucheck_width, eh, uivc_entity_event_enable_variable_self, "", page.condition_variable_self_enabled, dg);
var el_condition_variable_self=create_button(16+64, yy, "Self Variable", ew-64, eh, fa_center, null, dg);
yy=yy+eh+spacing;

var el_condition_item_enabled=create_checkbox(16, yy, "", ucheck_width, eh, uivc_entity_event_enable_item, "", page.condition_item_enabled, dg);
var el_condition_item=create_button(16+64, yy, "Posseses Item", ew-64, eh, fa_center, null, dg);
yy=yy+eh+spacing;
var el_condition_code_enabled=create_checkbox(16, yy, "", ucheck_width, eh, uivc_entity_event_enable_code, "", page.condition_code_enabled, dg);
var el_condition_code=create_button(16+64, yy, "Code Evaluation", ew-64, eh, fa_center, null, dg);
yy=yy+eh+spacing;

var el_option=create_text(16, yy, "Options", ew, eh, fa_left, ew, dg);
yy=yy+eh+spacing;
var el_option_movement=create_checkbox(16, yy, "Animate Movement", ew, eh, uivc_entity_event_animate_movement, "", page.option_animate_movement, dg);
el_option_movement.interactive=!entity.static;
yy=yy+eh+spacing;
var el_option_idle=create_checkbox(16, yy, "Animate Idle", ew, eh, uivc_entity_event_animate_idle, "", page.option_animate_idle, dg);
yy=yy+eh+spacing;
var el_option_direction_fix=create_checkbox(16, yy, "Direction Fix", ew, eh, uivc_entity_event_direction_fix, "", page.option_direction_fix, dg);

var yy=64;

var el_trigger=create_radio_array(c2+16, yy, "Trigger Method", ew, eh, uivc_entity_event_trigger, page.trigger, dg);
create_radio_array_options(el_trigger, "Action Button", "Player Touch", "Event Touch", "Autorun", "Parallel");
yy=yy+eh+eh*5+spacing;

var el_event=create_text(c2+16, yy, "Event Details", ew, eh, fa_left, ew, dg);
yy=yy+eh+spacing;
var el_event_guid=create_button(c2+16, yy, "Event: None Set", ew, eh, fa_left, null, dg);
yy=yy+eh+spacing;
var el_event_entrypoint=create_button(c2+16, yy, "Entrypoint: None Set", ew, eh, fa_left, null, dg);

yy=yy+eh+spacing;

var el_movement=create_radio_array(c2+16, yy, "Autonomous Movement", ew, eh, uivc_entity_event_auto_move, page.autonomous_movement, dg);
create_radio_array_options(el_movement, "Fixed", "Random", "Approach", "Custom");
el_movement.interactive=!entity.static;
yy=yy+eh+eh*4+spacing;
var el_movement_speed=create_input(c2+16, yy, "Move Speed:", ew, eh, uivc_entity_event_auto_speed, "", page.autonomous_movement_speed, "0 (slowest) - 5", validate_int, ui_value_real, 0, 5, 1, vx1+16, vy1, vx2, vy2, dg);
el_movement_speed.interactive=!entity.static;
yy=yy+eh+spacing;
var el_movement_frequency=create_input(c2+16, yy, "Move Frequency:", ew, eh, uivc_entity_event_auto_frequency, "", page.autonomous_movement_speed, "0 (slowest) - 4", validate_int, ui_value_real, 0, 4, 1, vx1+16, vy1, vx2, vy2, dg);
el_movement_frequency.interactive=!entity.static;
yy=yy+eh+spacing;
var el_movement_route=create_button(c2+16, yy, "Move Route", ew, eh, fa_center, null, dg);
el_movement_route.interactive=!entity.static;

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents, el_name, el_enabled, el_condition,
    el_condition_switch_global_enabled, el_condition_switch_global, el_condition_variable_global_enabled, el_condition_variable_global,
    el_condition_switch_self_enabled, el_condition_switch_self, el_condition_variable_self_enabled, el_condition_variable_self,
    el_condition_item_enabled, el_condition_item, el_condition_code_enabled, el_condition_code,
    el_option, el_option_movement, el_option_idle, el_option_direction_fix,
    el_trigger, el_movement, el_movement_speed, el_movement_frequency, el_movement_route,
    el_event, el_event_guid, el_event_entrypoint,
    el_confirm);

keyboard_string="";

return dg;
