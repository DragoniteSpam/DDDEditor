/// void dialog_create_settings_data(Dialog);

var dw=512;
var dh=320;

var dg=dialog_create(dw, dh, "Data Settings", dialog_default, dc_close_no_questions_asked, argument0);

var ew=(dw-64)/2;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var c2=dw/2;

// this is not drawing properly, fix
var el_embed_title=create_text(16, 64, "Data Embed Settings", ew, eh, fa_left, dw/2, dg);
var el_embed_tilesets=create_checkbox(16, 64+1*eh, "Embed tilesets", ew, eh, uivc_settings_embed_tilesets, "", Stuff.setting_embed_tilesets, dg);
var el_embed_npcs=create_checkbox(16, 64+2*eh, "Embed NPC graphics", ew, eh, uivc_settings_embed_npcs, "", Stuff.setting_embed_npcs, dg);
var el_embed_graphics=create_checkbox(16, 64+3*eh, "Embed other graphics", ew, eh, uivc_settings_embed_graphics, "", Stuff.setting_embed_graphics, dg);
var el_embed_meshes=create_checkbox(16, 64+4*eh, "Embed meshes", ew, eh, uivc_settings_embed_meshes, "", Stuff.setting_embed_meshes, dg);
var el_embed_se=create_checkbox(16, 64+5*eh, "Embed sound effects", ew, eh, uivc_settings_embed_se, "", Stuff.setting_embed_se, dg);

var el_other_title=create_text(16, 64+7*eh, "Data Settings", ew, eh, fa_left, dw/2, dg);
var el_other_compression=create_input(c2+16, 64+8*eh, "Compression Level: ", ew, eh, uivc_settings_embed_se, "", Stuff.setting_compression_level,
    Stuff.setting_compression_level, validate_int, ui_value_real, 1, 9, 1, vx1, vy1, vx2, vy2, dg);

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents, el_embed_title, el_embed_tilesets, el_embed_npcs, el_embed_graphics,
    el_embed_meshes, el_embed_se, el_other_title, el_other_compression, el_confirm);

keyboard_string="";

return dg;
