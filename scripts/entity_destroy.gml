/// void entity_destroy();
// because game maker does not seem to be inheriting Destroy
// events for me for some reason

if (cobject!=noone){
    c_world_destroy_object(cobject);
}

ActiveMap.population[ETypes.ENTITY]--;

if (am_solid){
    ActiveMap.population_solid--;
}
if (static){
    ActiveMap.population_static--;
}
