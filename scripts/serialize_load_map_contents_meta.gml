/// void serialize_load_map_contents_meta(buffer, version);

data_clear_map();

ActiveMap.name=buffer_read(argument0, buffer_string);
ActiveMap.internal_name=buffer_read(argument0, buffer_string);
ActiveMap.summary=buffer_read(argument0, buffer_string);

Stuff.save_name_map=ActiveMap.internal_name+EXPORT_EXTENSION_MAP;

var xx=buffer_read(argument0, buffer_u16);
var yy=buffer_read(argument0, buffer_u16);
var zz=buffer_read(argument0, buffer_u16);

ActiveMap.tileset=buffer_read(argument0, buffer_u8);

data_resize_map(xx, yy, zz);

if (argument1>=DataVersions.MAP_VARS){
    ActiveMap.audio_bgm=buffer_read(argument0, buffer_string);
    var n_ambient=buffer_read(argument0, buffer_u16);
    repeat(n_ambient){
        ds_list_add(ActiveMap.audio_ambient, buffer_read(argument0, buffer_string));
        ds_list_add(ActiveMap.audio_ambient_frequencies, buffer_read(argument0, buffer_u8));
    }
    
    ActiveMap.fog_start=buffer_read(argument0, buffer_f32);
    ActiveMap.fog_end=buffer_read(argument0, buffer_f32);
    
    var bools=buffer_read(argument0, buffer_u32);
    ActiveMap.indoors=unpack(bools, 0);
    ActiveMap.draw_water=unpack(bools, 1);
    ActiveMap.fast_travel_to=unpack(bools, 2);
    ActiveMap.fast_travel_from=unpack(bools, 3);
    
    if (argument1>=DataVersions.MAP_3D){
        ActiveMap.is_3d=unpack(bools, 4);
    }
}
