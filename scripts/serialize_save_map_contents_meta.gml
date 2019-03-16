/// void serialize_save_map_contents_meta(buffer);

buffer_write(argument0, buffer_datatype, SerializeThings.MAP_META);

// unlike most other data types we don't save in a loop here because
// there can only be one map loaded at a time

buffer_write(argument0, buffer_string, ActiveMap.name);
buffer_write(argument0, buffer_string, ActiveMap.internal_name);
buffer_write(argument0, buffer_string, ActiveMap.summary);

buffer_write(argument0, buffer_u16, ActiveMap.xx);
buffer_write(argument0, buffer_u16, ActiveMap.yy);
buffer_write(argument0, buffer_u16, ActiveMap.zz);

buffer_write(argument0, buffer_u8, ActiveMap.tileset);

var n_things=ds_list_size(ActiveMap.all_entities);
buffer_write(argument0, buffer_u32, n_things);

for (var i=0; i<n_things; i++){
    var thing=ActiveMap.all_entities[| i];
    buffer_write(argument0, buffer_u16, thing.etype);
    script_execute(thing.save_script, argument0, thing);
}
