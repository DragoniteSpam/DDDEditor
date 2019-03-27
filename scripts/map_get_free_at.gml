/// array map_get_free_at(xx, yy, zz, slot);

var thing=ActiveMap.map_grid[# argument0, argument1];
var cell=thing[@ argument2];

return cell[@ argument3]==noone;
