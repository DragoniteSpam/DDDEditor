var buffer=vertex_create_buffer();
vertex_begin(buffer, Stuff.vertex_format);

for (var i=0; i<ds_list_size(ActiveMap.batch_in_the_future); i++){
    var thing=ActiveMap.batch_in_the_future[| i];
    thing.batch_index=ds_list_size(ActiveMap.batches);
    
}

vertex_end(buffer);
vertex_freeze(buffer);

ds_list_add(ActiveMap.batches, buffer);

ds_list_clear(ActiveMap.batch_in_the_future);
