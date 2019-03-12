/// void serialize_load_tileset(buffer, version);

var version=argument1;

var ts_name=buffer_read(argument0, buffer_string);

var n_autotiles=buffer_read(argument0, buffer_u8);
var at_array=array_create(n_autotiles);
var at_passage=array_create(n_autotiles);
var at_priority=array_create(n_autotiles);
var at_flags=array_create(n_autotiles);
var at_tags=array_create(n_autotiles);

for (var i=0; i<n_autotiles; i++){
    // s16 because no tile is "noone"
    at_array[i]=buffer_read(argument0, buffer_s16);
    at_passage[i]=buffer_read(argument0, buffer_u8);
    at_priority[i]=buffer_read(argument0, buffer_u8);
    at_flags[i]=buffer_read(argument0, buffer_u8);
    at_tags[i]=buffer_read(argument0, buffer_u8);
}

var ts=tileset_create(ts_name, at_array);

// i really hope the garbage collector is doing its job with the old arrays

ts.at_passage=at_passage;
ts.at_priority=at_priority;
ts.at_flags=at_flags;
ts.at_tags=at_tags;

var t_grid_width=buffer_read(argument0, buffer_u16);
var t_grid_height=buffer_read(argument0, buffer_u16);

// the way i did this is a little weird and i don't know why - the grids
// (and autotile arrays, for that matter) already exist so there's no point
// in recreating them, so just populate their values instead

for (var i=0; i<t_grid_width; i++){
    for (var j=0; j<t_grid_height; h++){
        ts.passage[# i, j]=buffer_read(argument0, buffer_u8);
        ts.priority[# i, j]=buffer_read(argument0, buffer_u8);
        ts.flags[# i, j]=buffer_read(argument0, buffer_u8);
        ts.tags[# i, j]=buffer_read(argument0, buffer_u8);
    }
}
