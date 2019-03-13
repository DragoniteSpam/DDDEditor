/// void serialize_save_tilesets_meta(buffer);

buffer_write(argument0, buffer_datatype, SerializeThings.TILESET_META);

var n_tilesets=ds_list_size(Stuff.all_tilesets);
buffer_write(argument0, buffer_u16, n_tilesets);

for (var i=0; i<n_tilesets; i++){
    var ts=Stuff.all_tilesets[| i];
    
    buffer_write(argument0, buffer_string, ts.picture_name);
    
    // THESE ARE INDICES IN Stuff.abailable_autotiles!
    // THOSE NEED TO BE SAVED AS WELL! Do it later though.
    // with that in mind, saving these are trivially easy.
    var n_autotiles=array_length_1d(ts.autotiles);
    buffer_write(argument0, buffer_u8, n_autotiles);
    
    for (var i=0; i<n_autotiles; i++){
        // s16 because no tile is "noone"
        buffer_write(argument0, buffer_s16, ts.autotiles[i]);
        
        buffer_write(argument0, buffer_u8, ts.at_passage[i]);
        buffer_write(argument0, buffer_u8, ts.at_priority[i]);
        buffer_write(argument0, buffer_u8, ts.at_flags[i]);
        buffer_write(argument0, buffer_u8, ts.at_tags[i]);
    }
    
    // all of these grids will be the same dimensions so the
    // data can be saved in one loop
    
    var t_grid_width=ds_grid_width(ts.passage);
    var t_grid_height=ds_grid_height(ts.passage);
    
    buffer_write(argument0, buffer_u16, t_grid_width);
    buffer_write(argument0, buffer_u16, t_grid_height);
    
    for (var i=0; i<t_grid_width; i++){
        for (var j=0; j<t_grid_height; h++){
            buffer_write(argument0, buffer_u8, ts.passage[# i, j]);
            buffer_write(argument0, buffer_u8, ts.priority[# i, j]);
            buffer_write(argument0, buffer_u8, ts.flags[# i, j]);
            buffer_write(argument0, buffer_u8, ts.tags[# i, j]);
        }
    }
}
