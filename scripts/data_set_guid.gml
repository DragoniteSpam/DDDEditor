/// boolean data_set_guid(Data, value);

if (ds_map_exists(Stuff.all_guids, argument0.GUID)){
    ds_map_delete(Stuff.all_guids, argument0.GUID);
}

ds_map_add(Stuff.all_guids, argument1, argument0);
argument0.GUID=argument1;

return true;
