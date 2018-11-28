/// void dialog_create_settings_confirm_world_resize(Dialog);

var dw=400;
var dh=240;

var dg=dialog_create(dw, dh, "Hey, listen!", dialog_default, dc_settings, argument0);

var ew=(dw-64)/2;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var b_width=128;
var b_height=32;

var el_text=create_text(dg.x+dw/2-dw/3, dg.y+dh/3, "Entities which lie outside the new room boundary will be deleted. Would you still like to commit these changes?", 0, 0, fa_center, dw-128, dg);
var el_no=create_button(dg.x+dw/3-b_width/2, dg.y+dh-32-b_height/2, "Nope", b_width, b_height, fa_center, dmu_dialog_cancel, dg);
var el_yes=create_button(dg.x+dw*2/3-b_width/2, dg.y+dh-32-b_height/2, "Yes", b_width, b_height, fa_center, dmu_dialog_settings_confirm_world_resize, dg);

ds_list_add(dg.contents, el_text, el_no, el_yes);

ds_map_copy(dg.data, argument0.data);

keyboard_string="";
