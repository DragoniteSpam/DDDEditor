/// void dc_data_commit_seriously(UIButton);
// apply changes to data

var missing_output=buffer_create(1000, buffer_grow, 1);
var missing_count=0;

for (var i=0; i<ds_list_size(Stuff.original_data); i++){
    var data=Stuff.original_data[| i];
    if (guid_get(data.GUID)==noone){
        // then the type has been discarded and you don't need to check it
    } else if (data.is_enum){
        // then the type has no properties that depend on anything else
    } else {
        for (var j=0; j<ds_list_size(data.properties); j++){
            var property=data.properties[| j];
            // if the properties are data types, check to see if they still exist
            if (property.type==DataTypes.ENUM||property.type==DataTypes.DATA){
                if (guid_get(property.type_guid)==noone){
                    if (property.type==DataTypes.ENUM){
                        var typename="enum";
                    } else {
                        var typename="data type";
                    }
                    buffer_write(missing_output, buffer_string, "Data type attached to "+data.name+"."+property.name+" can no longer be found ("+typename+")"+N);
                    missing_count++;
                    // go through all instances and zero out the property values
                    for (var k=0; k<ds_list_size(data.instances); k++){
                        var instance=data.instances[| k];
                        instance.values[| j]=0;
                    }
                }
            }
        }
    }
}

// when done discard the cache and reset the old data; 99% sure this is order-
// dependant and that's a bad idea BUT IT WORKS (for now) SO DON'T TOUCH.
ds_list_destroy_instances_indirect(Stuff.original_data);
Stuff.original_data=noone;
data_apply_all_guids(Stuff.all_data);

if (buffer_tell(missing_output)>0){
    buffer_save_ext(missing_output, "missing.txt", 0, buffer_tell(missing_output));
    dialog_create_yes_or_no(argument0.root, string(missing_count)+" broken things were found. Would you like to view a log of these issues?", dmu_dialog_view_missing, "This is optional", "Yeah", dmu_dialog_dont_view_missing);
} else {
    dialog_destroy();
    dialog_destroy();
}
