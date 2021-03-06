/// EntityMesh instance_create_mesh(MeshName);

if (ds_map_exists(Stuff.vra_data, argument[0])){
    with (instance_create(0, 0, EntityMesh)){
        name=argument[0];
        mesh_id=argument[0];
        mesh_data=Stuff.vra_data[? argument[0]];

        switch (argument_count){
            case 1:
                break;
        }
        
        entity_init_collision_mesh(id);
        
        return id;
    }
}

return noone;
