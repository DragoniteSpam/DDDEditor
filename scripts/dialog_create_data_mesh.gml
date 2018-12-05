/// void dialog_create_data_mesh(Dialog);

var dw=512;
var dh=640;

var dg=dialog_create(dw, dh, "Data: Availalbe Meshes", dialog_default, dc_data_mesh, argument0);

var ew=(dw-64)/2;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var b_width=128;
var b_height=32;

var el_vrax=create_text(16, 64, "Mesh file (vrax): ", ew, eh, fa_left, dw-32, dg);
el_vrax.render=ui_render_text_vrax;

var el_load=create_button(16, 96, "Load", b_width, b_height, fa_center, dmu_dialog_load_vrax, dg);
el_load.render=ui_render_button_vrax;

/*var el_height=create_input(16, 96, "Map Height (Y): ", ew, eh, uivc_stash, "y", ActiveMap.yy, 1, validate_int, ui_value_real, 1, MAP_Y_LIMIT, 4, vx1, vy1, vx2, vy2, dg);
var el_depth=create_input(16, 128, "Map Depth (Z): ", ew, eh, uivc_stash, "z", ActiveMap.zz, 1, validate_int, ui_value_real, 1, MAP_Y_LIMIT, 4, vx1, vy1, vx2, vy2, dg);
var el_dummy=create_checkbox(16, 160, "Dummy option", ew, eh, null, "dummy", false, dg);*/

var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents, el_vrax, el_load,/*el_width, el_height, el_depth, el_dummy,*/ el_confirm);

keyboard_string="";
