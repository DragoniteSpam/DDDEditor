/// void map_add_thing(Entity, xx, yy, zz);
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

argument0.xx=argument1;
argument0.yy=argument2;
argument0.zz=argument3;

if (argument0.batchable){
    ds_list_add(ActiveMap.batch_in_the_future, argument0);
} else {
    ds_list_add(ActiveMap.dynamic, argument0);
}

ds_list_add(ActiveMap.all_entities, argument0);

map_transform_thing(argument0);
