/// void momu_editor_3d(MenuElement);

var catch=argument0;

Camera.mode=EditorModes.EDITOR_3D;

view_visible[view_fullscreen]=false;
view_visible[view_3d]=true;
view_visible[view_ribbon]=true;
view_visible[view_hud]=true;
view_visible[view_3d_preview]=false;

menu_activate(noone);
