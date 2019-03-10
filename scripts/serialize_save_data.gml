/// void serialize_save_data();

var fn=get_save_filename("DDD game data files|*"+EXPORT_EXTENSION_DATA, "game");
if (string_length(fn)>0){
    Stuff.save_name_data=string_replace(filename_name(fn), EXPORT_EXTENSION_DATA, "");
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
    buffer_write(buffer, buffer_u8, SERIALIZE_DATA);
    buffer_write(buffer, buffer_u32, things);
    
    /*
     * data
     */
    
    serialize_save_events(buffer);
    
    /*
     * that's it!
     */
    
    buffer_save_ext(buffer, fn, 0, buffer_tell(buffer));
    buffer_delete(buffer);
}
