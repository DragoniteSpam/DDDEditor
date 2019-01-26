/// void dialog_create_autotile_selector(Dialog);

var dw=512;
var dh=400;

var dg=dialog_create(dw, dh, "Data: Availalbe Meshes", dialog_default, dc_data_mesh, argument0);

var ew=(dw-64)/2;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var b_width=128;
var b_height=32;

// we need to access this later, if you re-load the meshes
/*var n=ds_list_size(Stuff.all_mesh_names);
dg.el_list=create_list(16, 128, "Available meshes: "+string(n), "<no meshes>", dw/2-16, b_height, 5, uivc_list_view_mesh, false, dg);
for (var i=0; i<n; i++){
    create_list_entries(dg.el_list, Stuff.all_mesh_names[| i]);
}*/

var el_confirm=create_button(dw/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg, HelpPages.AUTOTILES, fa_center);

ds_list_add(dg.contents, el_confirm);

keyboard_string="";

return dg;
