/// void momu_data(MenuElement);

var catch=argument0;

Camera.mode=EditorModes.EDITOR_DATA;

view_visible[view_fullscreen]=true;
view_visible[view_3d]=false;
view_visible[view_ribbon]=true;
view_visible[view_hud]=false;
view_visible[view_3d_preview]=false;

view_wview[view_fullscreen]=room_width;
view_wport[view_fullscreen]=room_width;

menu_activate(noone);

if (Camera.ui_game_data!=noone){
    instance_activate_object(Camera.ui_game_data);
    instance_destroy(Camera.ui_game_data);
}

Camera.ui_game_data=ui_init_game_data();
