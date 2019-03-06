/// void momu_editor_event(MenuElement);

var catch=argument0;

Camera.mode=EditorModes.EDITOR_EVENT;

view_visible[view_fullscreen]=true;
view_visible[view_3d]=false;
view_visible[view_ribbon]=true;
view_visible[view_hud]=false;
view_visible[view_3d_preview]=false;

menu_activate(noone);
