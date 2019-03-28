/// void dialog_create_data_types(Dialog);

var dw=960;
var dh=640;

var dg=dialog_create(dw, dh, "Data: Data", dialog_default, dc_close_no_questions_asked, argument0);
dg.x=dg.x-32;

var columns=3;
var ew=(dw-columns*32)/columns;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var b_width=128;
var b_height=32;

var spacing=16;

var yy=64;

el_list=create_list(16, yy, "Data Types: ", "<no data types>", ew, eh, 16, null, false, dg);
el_list.render=ui_render_list_data_data;
el_list.entries_are=ListEntries.INSTANCES;

dg.el_list_main=el_list;

yy=yy+el_list.height*el_list.slots+el_list.height+spacing;

el_add=create_button(16, yy, "Add", ew, eh, fa_center, omu_data_add, dg);
yy=yy+el_add.height+spacing;

el_remove=create_button(16, yy, "Remove", ew, eh, fa_center, omu_data_remove, dg);

el_confirm=create_button(dw/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg, HelpPages.AUTOTILES, fa_center);

ds_list_add(dg.contents, el_list, el_add, el_remove,
    el_confirm);

keyboard_string="";

return dg;
