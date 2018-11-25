/// boolean selected_rectangle(selection, Entity);

// since you don't know if start and end are in the correct
// order, you have to put them in the correct order
var minx=min(argument0.x1, argument0.x2);
var miny=min(argument0.y1, argument0.y2);
var minz=min(argument0.z1, argument0.z2);
var maxx=max(argument0.x1, argument0.x2);
var maxy=max(argument0.y1, argument0.y2);
var maxz=max(argument0.z1, argument0.z2);

// exclude the outer edge but don't have a negative area
var maxex=max(minx, maxx-1);
var maxey=max(miny, maxy-1);
var maxez=max(minz, maxz-1);

return is_clamped(argument1.xx, minx, maxex)&&is_clamped(argument1.yy, miny, maxey)&&is_clamped(argument1.zz, minz, maxez);
