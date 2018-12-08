/// void dmu_dialog_load_vrax(UIThing);

var fn=get_open_filename("virgo mesh collections (*.vrax)|*.vrax", "");

var vra_path=".\vra\";

if (file_exists(fn)){
    var new_names=data_load_vra_names_only(fn);
    var name_missing=false;
    for (var i=0; i<ds_list_size(ActiveMap.all_entites); i++){
        var thing=ActiveMap.all_entities[| i];
        if (instanceof(thing, EntityMesh)){
            if (ds_list_find_index(new_names, thing.name)==-1){
                name_missing=true;
            }
        }
    }
    ds_list_destroy(new_names);
    
    if (name_missing){
        // todo spawn confirm dialog informing the user that the new vrax does not
        // have all of the meshes in use by this map, and give the option to delete
        // entities whose mesh will be missing, or sub them out with a ?-sort of thing
    } else {
        // this should be in its own script since it's going to be called from the
        // confirm button in the above dialog
        var nn=filename_name(fn);
        file_copy(fn, vra_path+nn);
        with (Stuff){
            data_load_vra_actually_thanks(vra_path+nn);
            ini_open(".\data.ini");
            ini_write_string("important", "vrax", nn);
            ini_close();
        }
        clear_list_entries(argument0.root.el_list);
        for (var i=0; i<ds_list_size(Stuff.all_mesh_names); i++){
            create_list_entries(argument0.root.el_list, Stuff.all_mesh_names[| i]);
        }
    }
}
