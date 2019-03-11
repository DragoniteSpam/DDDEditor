/// void serialize_load_entity_mesh(buffer, Entity, version);

serialize_load_entity(argument0, argument1, argument2);

argument1.mesh_id=buffer_read(argument0, buffer_string);

// no bools

if (argument2>DataVersions.INITIAL){
}
