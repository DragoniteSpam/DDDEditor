/// void sa_foreach_cell(script, params array);
// processes each cell in the selection, but only once

var processed=ds_map_create();

for (var s=0; s<ds_list_size(selection); s++){
    var sel=selection[| s];
    
    var minx=min(sel.x1, sel.x2);
    var miny=min(sel.y1, sel.y2);
    var minz=min(sel.z1, sel.z2);
    var maxx=max(sel.x1, sel.x2);
    var maxy=max(sel.y1, sel.y2);
    var maxz=max(sel.z1, sel.z2);
    
    for (var i=minx; i<maxx; i++){
        for (var j=miny; j<maxy; j++){
            for (var k=minz; k<maxz; k++){
                var str=string(i)+","+string(j)+","+string(k);
                if (!ds_map_exists(processed, str)){
                    ds_map_add(processed, str, true);
                    script_execute(argument0, i, j, k, argument1);
                }
            }
        }
    }
}

ds_map_destroy(processed);
