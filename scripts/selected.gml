/// boolean selected(Entity);

// since you don't know if start and end are in the correct
// order, you have to put them in the correct order
var minx=min(selection_start[vec3.xx], selection_end[vec3.xx]);
var miny=min(selection_start[vec3.yy], selection_end[vec3.yy]);
var minz=min(selection_start[vec3.zz], selection_end[vec3.zz]);
var maxx=max(selection_start[vec3.xx], selection_end[vec3.xx]);
var maxy=max(selection_start[vec3.yy], selection_end[vec3.yy]);
var maxz=max(selection_start[vec3.zz], selection_end[vec3.zz]);

// exclude the outer edge but don't have a negative area
var maxex=max(minx, maxx-1);
var maxey=max(miny, maxy-1);
var maxez=max(minz, maxz-1);

return is_clamped(argument0.xx, minx, maxex)&&is_clamped(argument0.yy, miny, maxey)&&is_clamped(argument0.zz, minz, maxez);
