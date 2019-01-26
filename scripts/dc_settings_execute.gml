/// void dc_settings_execute(Dialog);
// Actually commits the settings. Only call this when you know it's
// safe to do so. Failing to do so will probably result in a memory leak.

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

// don't destroy and recreate, because you don't want to lose the
// information in it that's still useful
ds_grid_resize(ActiveMap.map_grid, ActiveMap.xx, ActiveMap.yy);
map_fill_grid(ActiveMap.map_grid, ActiveMap.zz);
