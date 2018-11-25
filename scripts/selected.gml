/// boolean selected(Entity);

for (var i=0; i<ds_list_size(selection); i++){
    var sel=selection[| i];
    // since you don't know if start and end are in the correct
    // order, you have to put them in the correct order
    var minx=min(sel.x1, sel.x2);
    var miny=min(sel.y1, sel.y2);
    var minz=min(sel.z1, sel.z2);
    var maxx=max(sel.x1, sel.x2);
    var maxy=max(sel.y1, sel.y2);
    var maxz=max(sel.z1, sel.z2);
    
    // exclude the outer edge but don't have a negative area
    var maxex=max(minx, maxx-1);
    var maxey=max(miny, maxy-1);
    var maxez=max(minz, maxz-1);
    
    if (is_clamped(argument0.xx, minx, maxex)&&is_clamped(argument0.yy, miny, maxey)&&is_clamped(argument0.zz, minz, maxez)){
        return true;
    }
}

return false;
