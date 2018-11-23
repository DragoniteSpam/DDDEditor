if (!selection_empty()){
    var x1=min(selection_start[vec3.xx], selection_end[vec3.xx]);
    var y1=min(selection_start[vec3.yy], selection_end[vec3.yy]);
    var x2=max(selection_start[vec3.xx], selection_end[vec3.xx]);
    var y2=max(selection_start[vec3.yy], selection_end[vec3.yy]);
    for (var i=x1; i<x2; i++){
        for (var j=y1; j<y2; j++){
            var addition=instance_create_tile(4, 0);
            map_add_thing(addition, i, j, 0);
            
            ds_list_add(changes, addition);
        }
    }
}
