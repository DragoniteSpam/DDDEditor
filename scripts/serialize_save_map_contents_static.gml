/// void serialize_save_map_contents_static(buffer, list_static);

buffer_write(argument0, buffer_datatype, SerializeThings.MAP_STATIC);

var n_things=ds_list_size(argument1);
buffer_write(argument0, buffer_u32, n_things);

for (var i=0; i<n_things; i++){
    var thing=argument1[| i];
    buffer_write(argument0, buffer_u16, thing.etype);
    script_execute(thing.save_script, argument0, thing);
}
