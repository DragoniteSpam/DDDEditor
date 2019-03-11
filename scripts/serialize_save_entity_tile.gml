/// void serialize_save_entity_tile(buffer, EntityTile);

serialize_save_entity(argument0, argument1);

buffer_write(argument0, buffer_u8, argument1.tile_x);
buffer_write(argument0, buffer_u8, argument1.tile_y);
buffer_write(argument0, buffer_u32, argument1.tile_color);
buffer_write(argument0, buffer_u8, floor(argument1.tile_alpha*255));

// no bools
