/// void serialize_save_map_tileset(buffer, DataTileset);

buffer_write(argument0, buffer_datatype, SerializeThings.TILESET_META);

buffer_write(argument0, buffer_string, argument1.picture_name);

// THESE ARE INDICES IN Stuff.abailable_autotiles!
// THOSE NEED TO BE SAVED AS WELL! Do it later though.
// with that in mind, saving these are trivially easy.
var n_autotiles=array_length_1d(argument1.autotiles);
buffer_write(argument0, buffer_u8, n_autotiles);
for (var i=0; i<n_autotiles; i++){
    buffer_write(argument0, buffer_s16, argument1.autotiles[i]);
    
    buffer_write(argument0, buffer_u8, argument1.at_passage[i]);
    buffer_write(argument0, buffer_u8, argument1.at_priority[i]);
    buffer_write(argument0, buffer_u8, argument1.at_flags[i]);
    buffer_write(argument0, buffer_u8, argument1.at_tags[i]);
}

// all of these grids will be the same dimensions so the
// data can be saved in one loop

var t_grid_width=ds_grid_width(argument1.passage);
var t_grid_height=ds_grid_height(argument1.passage);

buffer_write(argument0, buffer_s16, t_grid_width);
buffer_write(argument0, buffer_s16, t_grid_height);

for (var i=0; i<t_grid_width; i++){
    for (var j=0; j<t_grid_height; h++){
        buffer_write(argument0, buffer_u8, argument1.passage[# i, j]);
        buffer_write(argument0, buffer_u8, argument1.priority[# i, j]);
        buffer_write(argument0, buffer_u8, argument1.flags[# i, j]);
        buffer_write(argument0, buffer_u8, argument1.tags[# i, j]);
    }
}
