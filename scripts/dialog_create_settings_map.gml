/// void dialog_create_settings_map(Dialog);

var dw=512;
var dh=320;

var dg=dialog_create(dw, dh, "Map Settings", dialog_default, dc_settings_map, argument0);

var ew=(dw-64)/2;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var el_width=create_input(16, 64, "Map Width (X): ", ew, eh, uivc_stash, "x", ActiveMap.xx, 1, validate_int, ui_value_real, 1, MAP_X_LIMIT, 4, vx1, vy1, vx2, vy2, dg);
var el_height=create_input(16, 96, "Map Height (Y): ", ew, eh, uivc_stash, "y", ActiveMap.yy, 1, validate_int, ui_value_real, 1, MAP_Y_LIMIT, 4, vx1, vy1, vx2, vy2, dg);
var el_depth=create_input(16, 128, "Map Depth (Z): ", ew, eh, uivc_stash, "z", ActiveMap.zz, 1, validate_int, ui_value_real, 1, MAP_Y_LIMIT, 4, vx1, vy1, vx2, vy2, dg);

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Commit", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents, el_width, el_height, el_depth, el_confirm);

keyboard_string="";

return dg;
