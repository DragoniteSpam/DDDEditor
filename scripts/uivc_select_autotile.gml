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

var list=Camera.ui.t_p_autotile_editor.element_list.entries;
for (var i=0; i<AUTOTILE_MAX; i++){
    if (ActiveMap.tileset.autotiles[i]!=noone){
        var data=Stuff.available_autotiles[ActiveMap.tileset.autotiles[i]];
        // this can happen if an autotile graphic is removed while it's still being referenced by the game
        // todo some way to inform the user that this has happened
        if (is_array(data)){
            list[| i]=string(i)+"."+data[AvailableAutotileProperties.NAME];
        }
    }
}
