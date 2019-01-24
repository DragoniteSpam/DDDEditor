#define uivc_select_autotile
/// uivc_select_autotile(UITileSelector, tx, ty);

var catch=argument0;
var catch=argument1;
var catch=argument2;

// feel free to fill this in later

#define uivc_select_autotile_refresh
/// void uivc_select_autotile_refresh(index);

// refresh values that don't like to do it on their own
Camera.ui.t_p_autotile_editor.element_priority.value=string(ActiveMap.tileset.at_priority[Camera.selection_fill_autotile]);
Camera.ui.t_p_autotile_editor.element_tag.value=string(ActiveMap.tileset.at_tags[Camera.selection_fill_autotile]);
