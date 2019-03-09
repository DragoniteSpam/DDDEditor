/// void serialize_save_map();

var fn=get_save_filename("DDD map files|*"+EXPORT_EXTENSION_MAP, "map");
if (string_length(fn)>0){
    Stuff.save_name_map=string_replace(filename_name(fn), EXPORT_EXTENSION_MAP, "");
    game_auto_title();
    
    var buffer=buffer_create(2, buffer_grow, 1);
    
    /*
     * Header
     */
    
    var things=1;
    
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u32, VERSION_NUMBER);
    buffer_write(buffer, buffer_u32, SERIALIZE_DATA);
    buffer_write(buffer, buffer_u8, things);
    
    /*
     * data
     */
    
    /*
     * that's it!
     */
    
    buffer_save_ext(buffer, fn, 0, buffer_tell(buffer));
    buffer_delete(buffer);
}
