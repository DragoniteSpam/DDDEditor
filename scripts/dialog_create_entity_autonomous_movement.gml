/// void dialog_create_entity_autonomous_movement(Dialog);

var dw=640;
var dh=640;

// you can assume that this is valid data because this won't be called otherwise
var list=Camera.selected_entities;
var entity=list[| 0];
var dg=dialog_create(dw, dh, "Autonomous Movement", dialog_default, dc_close_no_questions_asked, argument0);

var columns=1;
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

var el_movement=create_radio_array(16, yy, "Autonomous Movement", ew, eh, uivc_entity_auto_move, entity.autonomous_movement, dg);
create_radio_array_options(el_movement, "Fixed", "Random", "Approach", "Custom");
el_movement.interactive=!entity.static;
yy=yy+ui_get_radio_array_height(el_movement)+spacing;

var el_movement_speed=create_radio_array(16, yy, "Move Speed", ew, eh, uivc_entity_auto_speed, entity.autonomous_movement_speed, dg);
create_radio_array_options(el_movement_speed, "1/8x", "1/4x", "1/2x", "1x", "2x", "4x");
el_movement_speed.interactive=!entity.static;
yy=yy+ui_get_radio_array_height(el_movement_speed)+spacing;

var el_movement_frequency=create_radio_array(16, yy, "Move Frequency", ew, eh, uivc_entity_auto_frequency, entity.autonomous_movement_frequency, dg);
create_radio_array_options(el_movement_frequency, "Slowest", "Slow", "Normal", "Fast", "Fastest");
el_movement_frequency.interactive=!entity.static;
yy=yy+ui_get_radio_array_height(el_movement_frequency)+spacing;

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents, el_movement, el_movement_speed, el_movement_frequency,
    el_confirm);

keyboard_string="";

return dg;