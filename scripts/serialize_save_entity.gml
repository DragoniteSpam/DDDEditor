/// void serialize_save_entity(buffer, Entity);
buffer_write(argument0, buffer_string, argument1.name);
buffer_write(argument0, buffer_u32, argument1.xx);
buffer_write(argument0, buffer_u32, argument1.yy);
buffer_write(argument0, buffer_u32, argument1.zz);

var entity_bools=pack(argument1.am_solid, argument1.static);
buffer_write(argument0, buffer_u32, entity_bools);

// DataVersions.MAP_ENTITY_EVENTS
var n_events=ds_list_size(argument1.object_events);
buffer_write(argument0, buffer_u8, n_events);
for (var i=0; i<n_events; i++){
    serialize_save_entity_event_page(argument0, argument1.object_events[| i]);
}

// DataVersions.ENTITY_TRANSFORM

buffer_write(argument0, buffer_f32, argument1.off_xx);
buffer_write(argument0, buffer_f32, argument1.off_yy);
buffer_write(argument0, buffer_f32, argument1.off_zz);

buffer_write(argument0, buffer_u16, argument1.rot_xx);
buffer_write(argument0, buffer_u16, argument1.rot_yy);
buffer_write(argument0, buffer_u16, argument1.rot_zz);

buffer_write(argument0, buffer_f32, argument1.scale_xx);
buffer_write(argument0, buffer_f32, argument1.scale_yy);
buffer_write(argument0, buffer_f32, argument1.scale_zz);
