/// boolean guid_set(Data, [value]);

// for data that already has a guid but isn't included in the lookup yet
if (argument_count==1){
    // if there's a collision, you ought to be informed (and explode)
    if (ds_map_exists(Stuff.all_guids, argument[0].GUID)){
        show_error("guid conflict: "+argument[0].name+" is trying to overwrite "+guid_get(argument[0].GUID).name+" ["+string(argument[1])+"]", true)
        ds_map_delete(Stuff.all_guids, argument[0].GUID);
    }
    
    ds_map_add(Stuff.all_guids, argument[0].GUID, argument[0]);
} else {
    // almost all data is automatically created with a GUID, so remove it
    if (ds_map_exists(Stuff.all_guids, argument[0].GUID)){
        ds_map_delete(Stuff.all_guids, argument[0].GUID);
    }
    
    // if there's a collision, you ought to be informed (and explode)
    if (ds_map_exists(Stuff.all_guids, argument[1])){
        show_error("guid conflict: "+argument[0].name+" is trying to overwrite "+guid_get(argument[1]).name+" ["+string(argument[1])+"]", true)
        ds_map_delete(Stuff.all_guids, argument[0].GUID);
    }
    
    ds_map_add(Stuff.all_guids, argument[1], argument[0]);
    argument[0].GUID=argument[1];
}

return true;
