/// void omu_data_remove(UIThing);

var catch=argument0;

var selection=ui_list_selection(argument0.root.el_list_main);

if (selection>=0){
    var what=argument0.root.selected_data;
    
    // if it's referenced by any other data property, get rid of
    // the data property - later on you probably want to ask; also,
    // custom event nodes/templates that use the property will need
    // to be adressed
    
    // for each data type
    for (var i=0; i<ds_list_size(Stuff.all_data); i++){
        var datadata=Stuff.all_data[| i];
        if (datadata!=what&&!datadata.is_enum){
            // for each property
            for (var j=0; j<ds_list_size(datadata.properties); j++){
                var property=datadata.properties[| j];
                if ((property.type==DataTypes.DATA&&!what.is_enum)||(property.type==DataTypes.ENUM&&what.is_enum)){
                    // for each instance, remove the entry if it's this type
                    for (var k=0; k<ds_list_size(datadata.instances); k++){
                        ds_list_delete(datadata.instances[| k], j);
                    }
                }
            }
        }
    }
    
    // this has NOT BEEN TESTED due to me not actually having any data
    // instanes to test it on yet. that needs to be done asap.
    
    // finish deleting
    instance_activate_object(what);
    instance_destroy(what);
    
    ds_map_clear(argument0.root.el_list_main.selected_entries);
    ds_map_clear(argument0.root.el_list_p.selected_entries);
    
    argument0.root.selected_data=noone;
    argument0.root.selected_property=noone;
    
    dialog_data_type_disable(argument0.root);
}
