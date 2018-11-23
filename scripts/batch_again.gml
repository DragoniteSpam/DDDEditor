/// void batch_again(index);

vertex_delete_buffer(ActiveMap.batches[| argument0]);
var list=ActiveMap.batch_instances[| argument0];

if (ds_list_size(list)>0){
    var buffer=vertex_create_buffer();
    vertex_begin(buffer, Camera.vertex_format);
    
    for (var i=0; i<ds_list_size(list); i++){
        var thing=list[| i];
        script_execute(thing.batch, buffer, thing);
    }
    
    vertex_end(buffer);
    vertex_freeze(buffer);
    
    ActiveMap.batches[| argument0]=buffer;
} else {
    ds_list_destroy(list);
    ds_list_delete(ActiveMap.batches, argument0);
    ds_list_delete(ActiveMap.batch_instances, argument0);
    
    for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
        var thing=ActiveMap.all_entities[| i];
        if (thing.batch_index>argument0){
            thing.batch_index--;
        }
    }
}
