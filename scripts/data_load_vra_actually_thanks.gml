/// void data_load_vra_actually_thanks(filename);

vra_name=filename_name(argument0);

var buffer=buffer_load(argument[0]);

var data=ds_map_create();
ds_map_read(data, buffer_read_string(buffer));

var version=data[? "version"];
if (ds_map_exists(data, "grid_size")){
    var grid_size=data[? "grid_size"];
} else {
    var grid_size=0;
}

if (ds_map_size(vra_data)>0){
    var key=ds_map_find_first(vra_data);
    while (key!=ds_map_find_last(vra_data)){
        var mesh_data=vra_data[? key];
        vertex_delete_buffer(mesh_data[@ MeshArrayData.VBUFF]);
        buffer_delete(mesh_data[@ MeshArrayData.DATA]);
        key=ds_map_find_next(vra_data, key);
    }
}

ds_map_destroy(data);

ds_map_clear(vra_data);

var n=buffer_read(buffer, T);

repeat(n){
    var model_name=buffer_read_string(buffer);
    var stuff=data_load_vra_next(buffer, grid_size);
    // if the name is already in use, destroy the new one
    // todo make a note of this somewhere
    if (ds_map_exists(vra_data, model_name)){
        vertex_delete_buffer(stuff[@ MeshArrayData.VBUFF]);
        buffer_delete(stuff[@ MeshArrayData.DATA]);
    } else {
        vra_data[? model_name]=stuff;
    }
}

buffer_delete(buffer);

// the vra program can alphabetize the names (badly), so
// to be safe we randomize them by sticking them in the map
// before adding them to the tree to increase the chances
// of it being balanced

if (ds_map_size(vra_data)>0){
    var key=ds_map_find_first(vra_data);
    while (key!=ds_map_find_last(vra_data)){
        ds_tree_add(all_mesh_tree, key);
        key=ds_map_find_next(vra_data, key);
    }
}
