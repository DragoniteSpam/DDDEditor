/// void serialize_save_entity(buffer, Entity);
buffer_write(argument0, buffer_string, argument1.name);
buffer_write(argument0, buffer_u32, argument1.xx);
buffer_write(argument0, buffer_u32, argument1.yy);
buffer_write(argument0, buffer_u32, argument1.zz);

var entity_bools=pack(argument1.am_solid, argument1.static);
buffer_write(argument0, buffer_u32, entity_bools);
