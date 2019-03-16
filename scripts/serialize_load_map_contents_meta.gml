/// void serialize_load_map_contents_meta(buffer, version);

var version=argument1;

data_clear_map();

ActiveMap.name=buffer_read(argument0, buffer_string);
ActiveMap.internal_name=buffer_read(argument0, buffer_string);
ActiveMap.summary=buffer_read(argument0, buffer_string);

var xx=buffer_read(argument0, buffer_u16);
var yy=buffer_read(argument0, buffer_u16);
var zz=buffer_read(argument0, buffer_u16);

ActiveMap.tileset=buffer_read(argument0, buffer_u8);

data_resize_map(xx, yy, zz);

var n_things=buffer_read(argument0, buffer_u32);

for (var i=0; i<n_things; i++){
    var type=buffer_read(argument0, buffer_u16);
    var thing=instance_create(0, 0, Stuff.etype_objects[type]);
    script_execute(thing.load_script, argument0, thing);
    
    map_add_thing(thing);
}
