/// void serialize_load_global_map_meta(buffer, version);

var version=argument1;

var n_maps=buffer_read(argument0, buffer_u16);
ds_map_clear(Stuff.all_maps);

repeat(n_maps){
    ds_map_add(Stuff.all_maps, buffer_read(argument0, buffer_string), true);
}
