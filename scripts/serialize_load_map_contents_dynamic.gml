/// void serialize_load_map_contents_dynamic(buffer, version);

var version=argument1;

var n_things=buffer_read(argument0, buffer_u32);

for (var i=0; i<n_things; i++){
    var type=buffer_read(argument0, buffer_u16);
    var thing=instance_create(0, 0, Stuff.etype_objects[type]);
    script_execute(thing.load_script, argument0, thing);
    
    map_add_thing(thing);
}
