/// void dc_settings(Dialog);

var map=argument0.data;

var xx=ActiveMap.xx;
var yy=ActiveMap.yy;
var zz=ActiveMap.zz;
if (ds_map_exists(map, "x")){
    xx=map[? "x"];
}
if (ds_map_exists(map, "y")){
    yy=map[? "y"];
}
if (ds_map_exists(map, "z")){
    yy=map[? "z"];
}

var oob=ds_list_create();
for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
    var thing=ActiveMap.all_entities[| i];
    if (thing.xx>=xx||thing.yy>=yy||thing.zz>=zz){
        ds_list_add(oob, thing);
    }
}

selection_clear();

if (!ds_list_empty(oob)){
    dialog_create_settings_confirm_world_resize(argument0);
} else {
    // normally when you do this kind of thing you'd want to destroy the
    // oob list (or other dynamic resources) first, but this doesn't
    // actually destroy the dialog, just informs the program that it needs
    // to be destroyed after everything has been rendered
    dialog_destroy();
}

ds_list_destroy(oob);
