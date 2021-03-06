/// void serialize_save_global_map_meta(buffer);

buffer_write(argument0, buffer_datatype, SerializeThings.MISC_MAP_META);

// remember, this is a map of names; the values are just "true" so it's more
// of a hashset that just identifies if a thing is an associated map
var map_list=ds_map_to_list(Stuff.all_maps);

var n_maps=ds_list_size(map_list);
buffer_write(argument0, buffer_u16, n_maps);

for (var i=0; i<n_maps; i++){
    buffer_write(argument0, buffer_string, map_list[| i]);
}

ds_list_destroy(map_list);
