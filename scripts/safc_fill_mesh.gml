/// void safc_fill_mesh(x, y, z, params array);

var catch=argument3;

if (!ds_list_empty(Stuff.all_mesh_names)){
    var addition=instance_create_mesh(Stuff.all_mesh_names[| Camera.selection_fill_mesh]);
    
    // there's no reason this should fail but just in case
    if (addition!=noone){
        map_add_thing(addition, argument0, argument1, argument2);
        ds_list_add(changes, addition);
    }
}
