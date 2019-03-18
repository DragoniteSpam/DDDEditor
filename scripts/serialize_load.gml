/// void serialize_load(filename);

var original=buffer_load(argument0);
var erroneous=false;
var header=chr(buffer_read(original, buffer_u8))+chr(buffer_read(original, buffer_u8))+chr(buffer_read(original, buffer_u8));

if (header=="DDD"){
    // if it's uncompressed, don't decompress it
    var buffer=original;
} else {
    // if it's compressed, decompress it - if possible
    var buffer=buffer_inflate(original, 0, buffer_get_size(original));
    buffer_delete(original);
}

if (buffer==-1){
    erroneous=true;
} else {
    buffer_seek(buffer, buffer_seek_start, 0);
    
    /*
     * Header
     */
    
    var header=chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8));
    
    if (header=="DDD"){
        Stuff.save_name_data=string_replace(filename_name(argument0), EXPORT_EXTENSION_DATA, "");
        game_auto_title();
        
        var version=buffer_read(buffer, buffer_u32);
        var what=buffer_read(buffer, buffer_u8);
        var things=buffer_read(buffer, buffer_u32);
        
        if (what==SERIALIZE_DATA){
            // clear all data
            ds_list_clear_instances(Stuff.all_events);
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
                // game stuff
                case SerializeThings.AUTOTILES_META:
                    serialize_load_autotiles_meta(buffer, version);
                    break;
                case SerializeThings.TILESET_META:
                    serialize_load_tilesets_meta(buffer, version);
                    break;
                case SerializeThings.EVENTS:
                    serialize_load_events(buffer, version);
                    break;
                case SerializeThings.MISC_MAP_META:
                    serialize_load_global_meta(buffer, version);
                    break;
                // map stuff
                case SerializeThings.MAP_META:
                    serialize_load_map_contents_meta(buffer, version);
                    break;
                case SerializeThings.MAP_BATCH:
                    serialize_load_map_contents_batch(buffer, version);
                    break;
                case SerializeThings.MAP_DYNAMIC:
                    serialize_load_map_contents_dynamic(buffer, version);
                    break;
            }
        }
        
        //if (what==SERIALIZE_MAP){
        Stuff.all_maps[? ActiveMap.internal_name]=true;
        //}
        
        instance_deactivate_object(Data);
        
        error_show();
    } else {
        erroneous=true;
    }
}

if (erroneous){
    dialog_create_notice(null, "this is a ddd* file but the contents are no good?");
}

/*
 * that's it!
 */

buffer_delete(buffer);
