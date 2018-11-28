/// void dmu_dialog_settings_confirm_world_resize(UIThing);

var map=argument0.root.data;

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

for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
    var thing=ActiveMap.all_entities[| i];
    if (thing.xx>=xx||thing.yy>=yy||thing.z>=zz){
        safa_delete(thing);
    }
}

dialog_destroy();
dialog_destroy();
