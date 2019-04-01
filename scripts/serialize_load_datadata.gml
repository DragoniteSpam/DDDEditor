/// void serialize_load_datadata(buffer, version);

var n_datadata=buffer_read(argument0, buffer_u16);

repeat (n_datadata){
    var bools=buffer_read(argument0, buffer_u8);
    
    if (unpack(bools, 0)){
        // is enum?
        var data=instance_create(0, 0, DataEnum);
    } else {
        // is data?
        var data=instance_create(0, 0, DataData);
    }
    guid_remove(data.GUID);
    
    serialize_load_generic(argument0, data, argument1);
    data.summary=buffer_read(argument0, buffer_string);
    
    data.deleted=unpack(bools, 1);
    
    guid_set(data.GUID);
    
    var n_properties=buffer_read(argument0, buffer_u16);
    repeat (n_properties){
        var property=instance_create(0, 0, DataProperty);
        guid_remove(property.GUID);
        
        serialize_load_generic(argument0, data, argument1);
        
        var pbools=buffer_read(argument0, buffer_u8);
        property.deleted=unpack(pbools, 0);
        
        if (data.is_enum){
            // nothing special was saved
        } else {
            property.range_min=buffer_read(argument0, buffer_f32);
            property.range_max=buffer_read(argument0, buffer_f32);
            property.number_scale=buffer_read(argument0, buffer_u8);
            property.char_limit=buffer_read(argument0, buffer_u16);
            property.bool_list=buffer_read(argument0, buffer_u8);
            property.type_guid=buffer_read(argument0, buffer_f32);
            
        }
    }
}
