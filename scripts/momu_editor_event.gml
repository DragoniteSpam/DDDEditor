/// void momu_editor_event(MenuElement);

var catch=argument0;

Camera.mode=EditorModes.EDITOR_EVENT;

view_visible[view_fullscreen]=true;
view_visible[view_3d]=false;
view_visible[view_ribbon]=true;
view_visible[view_hud]=true;
view_visible[view_3d_preview]=false;

view_xview[view_hud]=room_width-view_hud_width_event;
view_wview[view_hud]=view_hud_width_event;
view_xport[view_hud]=room_width-view_hud_width_event;
view_wport[view_hud]=view_hud_width_event;

view_wview[view_fullscreen]=room_width-view_hud_width_event;
view_wport[view_fullscreen]=room_width-view_hud_width_event;

menu_activate(noone);
