/// void data_resize_map(xx, yy, zz);

ActiveMap.xx=argument0;
ActiveMap.yy=argument1;
ActiveMap.zz=argument2;

graphics_create_grid();

ds_grid_resize(ActiveMap.map_grid, argument0, argument1);
map_fill_grid(ActiveMap.map_grid, argument2);
