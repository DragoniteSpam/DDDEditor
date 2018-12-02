/// void dc_settings_execute(Dialog);
// Actually commits the settings. Only call this when you know it's
// save to do so. Failing to do so will probably result in a memory leak.

var map=argument0.data;

if (ds_map_exists(map, "x")){
    ActiveMap.xx=map[? "x"];
}
if (ds_map_exists(map, "y")){
    ActiveMap.yy=map[? "y"];
}
if (ds_map_exists(map, "z")){
    ActiveMap.zz=map[? "z"];
}

graphics_create_grid();
