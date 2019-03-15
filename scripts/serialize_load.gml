/// void serialize_load(filename);

var buffer=buffer_load(argument0);

/*
 * Header
 */

var header=chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8));

if (header=="DDD"){
    Stuff.save_name_data=string_replace(filename_name(argument0), EXPORT_EXTENSION_DATA, "");
    game_auto_title();
    
    var version=buffer_read(buffer, buffer_u32);
    var data=buffer_read(buffer, buffer_u8);
    var things=buffer_read(buffer, buffer_u32);
    
    if (data==SERIALIZE_DATA){
        // clear all data
        for (var i=0; i<ds_list_size(Stuff.all_events); i++){
            instance_destroy(Stuff.all_events[| i]);
        }
        ds_list_clear(Stuff.all_events);
    } else if (data==SERIALIZE_MAP){
        // todo clear editor map
    }
    
    /*
     * data types
     */
    
    for (var i=0; i<things; i++){
        var datatype=buffer_read(buffer, buffer_datatype);
        switch (datatype){
            case SerializeThings.AUTOTILES_META:
                serialize_load_autotiles_meta(buffer, version);
                break;
            case SerializeThings.TILESET_META:
                serialize_load_tilesets_meta(buffer, version);
                break;
            case SerializeThings.EVENTS:
                serialize_load_events(buffer, version);
                break;
        }
    }
    
    if (data==SERIALIZE_MAP){
        Stuff.all_maps[? ActiveMap.internal_name]=true;
    }
    
    instance_deactivate_object(Data);
} else {
    show_message("this is a ddd file but the contents are no good?");
}

/*
 * that's it!
 */

buffer_delete(buffer);
