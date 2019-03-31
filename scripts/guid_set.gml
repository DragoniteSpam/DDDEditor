/// boolean guid_set(Data, value);

// almost all data is automatically created with a GUID, so remove it
if (ds_map_exists(Stuff.all_guids, argument0.GUID)){
    ds_map_delete(Stuff.all_guids, argument0.GUID);
}

// if there's a collision, you ought to be informed (and explode)
if (ds_map_exists(Stuff.all_guids, argument1)){
    show_error("guid conflict: "+argument0.name+" is trying to overwrite "+guid_get(argument1).name+" ["+string(argument1)+"]", true)
    ds_map_delete(Stuff.all_guids, argument0.GUID);
}

ds_map_add(Stuff.all_guids, argument1, argument0);
argument0.GUID=argument1;

return true;
