/// void data_load_vra_on_the_fly(UIThing, vra path, filename);

var nn=filename_name(argument2);
file_copy(argument2, argument1+nn);
with (Stuff){
    data_load_vra_actually_thanks(argument1+nn);
    ini_open(".\data.ini");
    ini_write_string("important", "vrax", nn);
    ini_close();
}
clear_list_entries(argument0.root.el_list);
for (var i=0; i<ds_list_size(Stuff.all_mesh_names); i++){
    create_list_entries(argument0.root.el_list, Stuff.all_mesh_names[| i]);
}

for (var i=0; i<ds_list_size(ActiveMap.all_entities); i++){
    var thing=ActiveMap.all_entities[| i];
    if (instanceof(thing, EntityMesh)){
        if (ds_map_exists(Stuff.vra_data, thing.mesh_id)){
            thing.mesh_data=Stuff.vra_data[? thing.mesh_id];
        } else {
            safa_delete(thing);
        }
    }
}
