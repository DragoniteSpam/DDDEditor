/// serialize_load_generic(buffer, Data, version);

var version=argument2;

argument1.name=buffer_read(argument0, buffer_string);
argument1.flags=buffer_read(argument0, buffer_u32);
data_set_guid(argument1, buffer_read(argument0, buffer_u32));
