/// void serialize_save_map();

var fn=get_save_filename("DDD map files|*"+EXPORT_EXTENSION_MAP, "map");
if (string_length(fn)>0){
    Stuff.save_name_map=string_replace(filename_name(fn), EXPORT_EXTENSION_MAP, "");
    game_auto_title();
    
    var buffer=buffer_create(2, buffer_grow, 1);
    
    /*
     * Header
     */
    
    var things=3;
    
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u32, DataVersions.INITIAL);
    buffer_write(buffer, buffer_u8, SERIALIZE_DATA);
    buffer_write(buffer, buffer_u32, things);
    
    
    // for each entity, this gets written in first, and the result is used
    // to determine the type of object to create
    //buffer_write(argument0, buffer_u16, argument1.etype);
    
    /*
     * data
     */
    
    // this one should always come first becaues it defines things
    // like size and tileset
    serialize_save_map_contents_meta(buffer);
    
    // these can come in any order although there probably won't be
    // a great deal of them
    serialize_save_map_contents_static(buffer);
    serialize_save_map_contents_dynamic(buffer);
    
    /*
     * that's it!
     */
    
    var compressed=buffer_deflate(buffer, 0, buffer_tell(buffer), Stuff.setting_compression_level);
    buffer_save_ext(compressed, fn, 0, buffer_tell(compressed));
    buffer_delete(buffer);
    buffer_delete(compressed);
    
    Stuff.all_maps[? ActiveMap.internal_name]=true;
}
