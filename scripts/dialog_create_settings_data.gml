#define dialog_create_settings_data
/// void dialog_create_settings_data(Dialog);

var dw=512;
var dh=640;

var dg=dialog_create(dw, dh, "Data Settings", dialog_default, dc_close_no_questions_asked, argument0);

var ew=(dw-64)/2;
var eh=24;

var vx1=dw/4+16;
var vy1=0;
var vx2=vx1+80;
var vy2=vy1+eh;

var c2=dw/2;

var yy=64;

var el_gameplay_title=create_text(16, yy, "General Game Settings", ew, eh, fa_left, dw/2, dg);
yy=yy+eh;
var el_gameplay_grid=create_checkbox(16, yy, "Snap Player to Grid", ew, eh, uivc_settings_game_grid, "", Stuff.game_player_grid, dg);

yy=yy+32;
var el_embed_title=create_text(16, yy, "Data Embed Settings", ew, eh, fa_left, dw/2, dg);
yy=yy+eh;
var el_embed_tilesets=create_checkbox(16, yy, "Embed tilesets", ew, eh, uivc_settings_embed_tilesets, "", Stuff.setting_embed_tilesets, dg);
yy=yy+eh;
var el_embed_npcs=create_checkbox(16, yy, "Embed NPC graphics", ew, eh, uivc_settings_embed_npcs, "", Stuff.setting_embed_npcs, dg);
yy=yy+eh;
var el_embed_graphics=create_checkbox(16, yy, "Embed other graphics", ew, eh, uivc_settings_embed_graphics, "", Stuff.setting_embed_graphics, dg);
yy=yy+eh;
var el_embed_meshes=create_checkbox(16, yy, "Embed meshes", ew, eh, uivc_settings_embed_meshes, "", Stuff.setting_embed_meshes, dg);
yy=yy+eh;
var el_embed_se=create_checkbox(16, yy, "Embed sound effects", ew, eh, uivc_settings_embed_se, "", Stuff.setting_embed_se, dg);
yy=yy+eh+eh;

var el_other_title=create_text(16, yy, "Data Settings", ew, eh, fa_left, dw/2, dg);
yy=yy+eh;
var el_other_compression=create_input(16, yy, "Compression: ", ew, eh, uivc_settings_compression_level, "", Stuff.setting_compression_level,
    Stuff.setting_compression_level, validate_int, ui_value_real, 0, 9, 1, vx1, vy1, vx2, vy2, dg);

// second column

yy=64;

// todo some kind of indication of which map is supposed to be the starting map - perhaps give each
// element a "color" which the text is drawn with too

var el_map_list=create_list(c2+16, yy, "Identified Maps", "<no maps>", ew, eh, 8, null, false, dg);
dialog_create_settings_data_map_list(el_map_list);

dg.el_map_list=el_map_list;

yy=yy+eh+eh*8+eh/2;

var el_map_delete=create_button(c2+16, yy, "Dereference", ew, eh, fa_middle, dmu_data_dereference, dg);

yy=yy+eh+eh/2;

var el_map_starting=create_button(c2+16, yy, "Make Starting Map", ew, eh, fa_middle, dmu_data_starting_map, dg);

// confirm

var b_width=128;
var b_height=32;
var el_confirm=create_button(dw/2-b_width/2, dh-32-b_height/2, "Done", b_width, b_height, fa_center, dmu_dialog_commit, dg);

ds_list_add(dg.contents,
    el_gameplay_title, el_gameplay_grid,
    el_embed_title, el_embed_tilesets, el_embed_npcs, el_embed_graphics,
    el_embed_meshes, el_embed_se, el_other_title, el_other_compression,
    el_map_list, el_map_delete, el_map_starting,
    el_confirm);

keyboard_string="";

return dg;

#define dialog_create_settings_data_map_list
/// void dialog_create_settings_data_map_list(UIList);

var data_maps=ds_map_to_list_sorted(Stuff.all_maps);

ui_list_clear(argument0);

for (var i=0; i<ds_list_size(data_maps); i++){
    if (Stuff.game_map_starting==data_maps[| i]){
        var c=c_blue;
    } else {
        var c=c_black;
    }
    create_list_entries(argument0, data_maps[| i], c);
}

ds_list_destroy(data_maps);