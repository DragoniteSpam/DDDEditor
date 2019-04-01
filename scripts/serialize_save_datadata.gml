/// void serialize_save_datadata(buffer);

buffer_write(argument0, buffer_datatype, SerializeThings.DATADATA);

var n_datadata=ds_list_size(Stuff.all_data);
buffer_write(argument0, buffer_u16, n_datadata);

for (var i=0; i<n_datadata; i++){
    var datadata=Stuff.all_data[| i];
    
    serialize_save_generic(argument0, datadata);
    buffer_write(argument0, buffer_string, datadata.summary);
    buffer_write(argument0, buffer_u8, datadata.deleted);
    
    var n_properties=ds_list_size(datadata.properties);
    buffer_write(argument0, buffer_u16, n_properties);
    
    for (var j=0; j<n_properties; j++){
        var property=datadata.properties[| j];
        
        serialize_save_generic(argument0, property);
        buffer_write(argument0, buffer_u8, pack(property.is_enum, property.deleted));
        
        if (datadata.is_enum){
            // then nothing else matters
        } else {
            buffer_write(argument0, buffer_f32, property.range_min);
            buffer_write(argument0, buffer_f32, property.range_max);
            buffer_write(argument0, buffer_u8, property.number_scale);
            buffer_write(argument0, buffer_u16, property.char_limit);
            buffer_write(argument0, buffer_u8, property.bool_list);
            buffer_write(argument0, buffer_u32, property.type_guid);
            
        }
    }
    
    // instances are saved in a loop later
}
