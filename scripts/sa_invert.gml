if (!selection_empty()){
    var x1=min(selection_start[vec3.xx], selection_end[vec3.xx]);
    var y1=min(selection_start[vec3.yy], selection_end[vec3.yy]);
    var x2=max(selection_start[vec3.xx], selection_end[vec3.xx]);
    var y2=max(selection_start[vec3.yy], selection_end[vec3.yy]);
    
    var l=x2-x1;
    var w=y2-y1;
    
    var grid=ds_grid_create(l, w);
    ds_grid_clear(grid, false);
    
    for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
        var thing=ActiveMap.all_entities[| i];
        if (selected(thing)){
            grid[# thing.xx-x1, thing.yy-y1]=true;
            thing.modification=Modifications.REMOVE;
            ds_list_add(changes, thing);
        }
    }
    
    for (var i=0; i<l; i++){
        for (var j=0; j<w; j++){
            if (!grid[# i, j]){
                var addition=instance_create_tile(4, 0);
                map_add_thing(addition, x1+i, y1+j, 0);
                ds_list_add(changes, addition);
            }
        }
    }
    
    ds_grid_destroy(grid);
}
