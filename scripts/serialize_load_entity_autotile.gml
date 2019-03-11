/// void serialize_load_entity_autotile(buffer, Entity, version);

serialize_load_entity_tile(argument0, argument1, argument2);

argument1.autotile_id=buffer_read(argument0, buffer_u8);
argument1.segment_id=buffer_read(argument0, buffer_u8);

// no bools

if (argument2>DataVersions.INITIAL){
}
