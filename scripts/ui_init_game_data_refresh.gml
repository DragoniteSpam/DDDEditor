/// ui_init_game_data_refresh();
/*
 * 1. check to see if there are any lists of the selected type already created; if there are,
 *      refresh them
 * 2. assign values to the property field things
 */

var data=guid_get(Camera.ui_game_data.active_type_guid);
var selection=ui_list_selection(Camera.ui_game_data.el_instances);

if (selection<0){
    var instance=noone;
} else {
    var instance=guid_get(data.instances[| selection].GUID);
}

if (instance!=noone){
    Camera.ui_game_data.el_inst_name.value=instance.name;
} else {
    Camera.ui_game_data.el_inst_name.value="";
}

// if you got to this point, you already know data has a value
// container
var dynamic=Camera.ui_game_data.el_dynamic;
var n=0;
for (var i=0; i<ds_list_size(dynamic.contents); i++){
    // another container
    var column=dynamic.contents[| i];
    
    // slot 0 in column 0 is taken up by "name" which doesn't count
    if (i==0){
        var start=1;
    } else {
        var start=0;
    }
    for (var j=start; j<ds_list_size(column.contents); j++){
        // it'd be nice if i could just add the elements to a list and go over the
        // list without having to "physically" go down each column and row, but then
        // the list would be orphaned/memory leak unless i do some other things that
        // i don't feel like doing
        var property=data.properties[| n];
        var thingy=column.contents[| j];
        
        // only check data, not enums
        if (property.type==DataTypes.DATA){
            if (property.type_guid==data.GUID){
                // element
                ui_list_clear(thingy);
                for (var k=0; k<ds_list_size(data.instances); k++){
                    create_list_entries(thingy, data.instances[| k], c_black);
                }
            }
        }
        
        if (instance!=noone){
            thingy.value=string(instance.values[| n]);
        } else {
            switch (property.type){
                case DataTypes.INT:
                case DataTypes.FLOAT:
                case DataTypes.BOOL_ARRAY:
                case DataTypes.ENUM:
                case DataTypes.DATA:
                    thingy.value=0;
                    break;
                case DataTypes.STRING:
                    thingy.value="";
                    break;
                case DataTypes.BOOL:
                    thingy.value=false;
                    break;
            }
        }
        
        n++;
    }
}
