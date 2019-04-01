/// ui_init_game_data_activate(GUID);

var container=Camera.ui_game_data.el_dynamic;
var data=guid_get(active_type_guid);

// i'm really hoping UI elements are destroyed correctly now
ds_list_clear_instances(container.contents);

if (data!=noone){
    var columns=5;
    var spacing=16;
    
    var cw=(room_width-columns*32)/columns;
    var ew=cw-spacing*2;
    var eh=24;
    
    var vx1=room_width/(columns*2)-16;
    var vy1=0;
    var vx2=vx1+room_width/(columns*2)-16;
    var vy2=vy1+eh;
    
    var b_width=128;
    var b_height=32;
    
    var yy=64+eh;
    var yy_base=yy;
    var element;
    
    /*
     * the list on the side is pretty important
     */
    
    var col_yy=yy;
    var col_data=instance_create(0, 0, UIThing);        // it gets positioned in the Draw event
    ds_list_add(container.contents, col_data);
    
    for (var i=0; i<ds_list_size(data.properties); i++){
        var property=data.properties;
        switch (property.type){
            case DataTypes.INT:            // input
                var char_limit=log10(max(abs(property.range_min), abs(property.range_max)));
                if (property.range_min<0||property.range_max<0){
                    char_limit++;
                }
                var element=create_input(spacing, yy, property.name, ew, eh, null, property.name, property.range_min, string(property.range_min)+" - "+string(property.range_max), validate_int, ui_value_real,
                    property.range_min, property.range_max, char_limit, vx1, vy1, vx2, vy2, noone);
                var hh=element.height;
                break;
            case DataTypes.FLOAT:          // input
                var element=create_input(spacing, yy, property.name, ew, eh, null, property.name, property.range_min, string(property.range_min)+" - "+string(property.range_max), validate_int, ui_value_real,
                    property.range_min, property.range_max, 10 /* hard-coded do not touch */, vx1, vy1, vx2, vy2, noone);
                var hh=element.height;
                break;
            case DataTypes.STRING:         // input
                var element=create_input(spacing, yy, property.name, ew, eh, null, property.name, def_value, help_text, validate_string, ui_value_string,
                    0, 1, property.char_limit, vx1, vy1, vx2, vy2, noone);
                var hh=element.height;
                break;
            case DataTypes.ENUM:           // list
                var element=create_list(spacing, yy, property.name, "<no options>", ew, eh, 8, null, false, noone);
                element.key=property.name;
                var hh=ui_get_list_height(element);
            case DataTypes.DATA:           // list
                var element=create_list(spacing, yy, property.name, "<no options>", ew, eh, 8, null, false, noone);
                element.key=property.name;
                var hh=ui_get_list_height(element);
                break;
            case DataTypes.BOOL:           // checkbox
                var element=create_checkbox(spacing, yy, property.name, ew, eh, null, property.name, false, noone);
                var hh=element.height;
                break;
            case DataTypes.BOOL_ARRAY:     // bitfield
                var element=noone;
                var hh=0;
                break;
        }
        
        if (yy+hh>room_height-160){
            col_data=instance_create(0, 0, UIThing);
            ds_list_add(container.contents, col_data);
            element.y=yy_base;
            yy=yy_base;
        }
        
        ds_list_add(col_data.contents, element);
    }
}
