/// void serialize_save_data();

var fn=get_save_filename("DDD game data files|*"+EXPORT_EXTENSION_DATA, "game");
if (string_length(fn)>0){
    Stuff.save_name_data=string_replace(filename_name(fn), EXPORT_EXTENSION_DATA, "");
    game_auto_title();
    
    var buffer=buffer_create(2, buffer_grow, 1);
    
    /*
     * Header
     */
    
    var things=4;
    
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u8, $44);
    buffer_write(buffer, buffer_u32, CURRENT_VERSION);
    buffer_write(buffer, buffer_u8, SERIALIZE_DATA);
    buffer_write(buffer, buffer_u32, things);
    
    /*
     * data
     */
    
    serialize_save_autotiles_meta(buffer);
    serialize_save_tilesets_meta(buffer);
    serialize_save_events(buffer);
    serialize_save_global_meta(buffer);
    
    /*
     * that's it!
     */
    
    if (Stuff.setting_compression_level==0){
        buffer_save_ext(buffer, fn, 0, buffer_tell(buffer));
    } else {
        var compressed=buffer_deflate(buffer, 0, buffer_tell(buffer), Stuff.setting_compression_level);
        buffer_save_ext(compressed, fn, 0, buffer_tell(compressed));
        buffer_delete(compressed);
    }
    
    buffer_delete(buffer);
}

enum DataVersions {
    INITIAL                     =0,
    VRAX_REFERENCE              =1,
    STARTING_MAP                =2,
    MAP_VARS                    =3,
}
