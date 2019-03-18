/// void dialog_create_settings_map(Dialog);

var dw=512;
var dh=640;

var dg=dialog_create(dw, dh, "Map Settings", dialog_default, dc_settings_map, argument0);

var ew=(dw-64)/2;
var eh=24;

var c2=dw/2;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var yy=64;
var vx2=dw-32;

var el_name_text=create_text(16, yy, "Settings: Text", ew, eh, fa_left, ew, dg);
yy=yy+32;
var el_name=create_input(16, yy, "Name: ", ew, eh, uivc_stash, "name", ActiveMap.name, 1, validate_string, ui_value_string, 0, 0, 32, vx1, vy1, vx2, vy2, dg);
yy=yy+32;
var el_name_internal=create_input(16, yy, "Internal name: ", ew, eh, uivc_stash, "name-internal", ActiveMap.internal_name, 1, validate_string, ui_value_string, 0, 0, 32, vx1, vy1, vx2, vy2, dg);

None of this is doing anything yet and class is startingn soon

yy=yy+32;

var eh_long=240;
var vy2=vy1+eh_long;

var el_summary=create_input(16, yy, "Summary: ", ew, eh_long, uivc_stash, "summary", ActiveMap.summary, 1, validate_string, ui_value_string, 0, 0, 400, vx1, vy1, vx2, vy2, dg);

var vx2=vx1+80;
var vy2=vy1+eh;

yy=yy+eh_long;
var el_dim_text=create_text(16, yy, "Settings: Dimensions", ew, eh, fa_left, ew, dg);
yy=yy+32;
var el_width=create_input(16, yy, "Map Width (X): ", ew, eh, uivc_stash, "x", ActiveMap.xx, 1, validate_int, ui_value_real, 1, MAP_X_LIMIT, 4, vx1, vy1, vx2, vy2, dg);
yy=yy+32;
var el_height=create_input(16, yy, "Map Height (Y): ", ew, eh, uivc_stash, "y", ActiveMap.yy, 1, validate_int, ui_value_real, 1, MAP_Y_LIMIT, 4, vx1, vy1, vx2, vy2, dg);
yy=yy+32;
var el_depth=create_input(16, yy, "Map Depth (Z): ", ew, eh, uivc_stash, "z", ActiveMap.zz, 1, validate_int, ui_value_real, 1, MAP_Y_LIMIT, 4, vx1, vy1, vx2, vy2, dg);

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Commit", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents, el_name_text, el_name, el_name_internal, el_summary,
    el_dim_text, el_width, el_height, el_depth, el_confirm);

keyboard_string="";

return dg;
