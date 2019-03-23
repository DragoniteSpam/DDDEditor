/// void serialize_load_entity(buffer, Entity, version);

argument1.name=buffer_read(argument0, buffer_string);
argument1.xx=buffer_read(argument0, buffer_u32);
argument1.yy=buffer_read(argument0, buffer_u32);
argument1.zz=buffer_read(argument0, buffer_u32);

var state_solid=argument1.am_solid;
var state_static=argument1.static;

var entity_bools=buffer_read(argument0, buffer_u32);
argument1.am_solid=unpack(entity_bools, 0);
argument1.static=unpack(entity_bools, 1);

// meshes and pawns are solid by default, so if the state of their
// solidness changes, this needs to be reflected in the map stats
// counter
if (state_solid&&!argument1.am_solid){
    ActiveMap.population_solid--;
} else if (!state_solid&&argument1.am_solid){
    ActiveMap.population_solid++;
}

// same for statics
if (state_static&&!argument1.static){
    ActiveMap.population_static--;
} else if (!state_static&&argument1.static){
    ActiveMap.population_static++;
}

// when you add things on you're probably going to append them to the
// end so the cascading switch statement won't work, so check each old
// version in ascending order

if (argument2>DataVersions.INITIAL){
}

// this should not be instantiated on its own and does not
// get collision information
