/// ui_init_game_data_activate();

var container=Camera.ui_game_data.el_dynamic;
if (Stuff.setting_alphabetize_lists){
    var sorted=ds_list_sort_name_sucks(Stuff.all_data);
    var data=guid_get(ui_list_selection(sorted[| 0].GUID));
    ds_list_destroy(sorted);
} else {
    var data=guid_get(Stuff.all_data[| ui_list_selection(Camera.ui_game_data.el_master)].GUID);
}

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
    
    var yy=24/*64+eh*/;
    var yy_base=yy;
    
    var col_yy=yy;
    var col_data=instance_create(/*2*cw+*/spacing, 0, UIThing);
    ds_list_add(container.contents, col_data);
    
    for (var i=0; i<ds_list_size(data.properties); i++){
        var property=data.properties[| i];
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
                var element=create_input(spacing, yy, property.name, ew, eh, null, property.name, "", "string", validate_string, ui_value_string,
                    0, 1, property.char_limit, vx1, vy1, vx2, vy2, noone);
                var hh=element.height;
                break;
            case DataTypes.ENUM:           // list
                var element=create_list(spacing, yy, property.name, "<no options: "+guid_get(property.type_guid).name+">", ew, eh, 8, null, false, noone);
                element.key=property.name;
                var hh=ui_get_list_height(element);
            case DataTypes.DATA:           // list
                var element=create_list(spacing, yy, property.name, "<no options: "+guid_get(property.type_guid).name+">", ew, eh, 8, null, false, noone);
                element.key=property.name;
                var hh=ui_get_list_height(element);
                break;
            case DataTypes.BOOL:           // checkbox
                var element=create_checkbox(spacing, yy, property.name, ew, eh, null, property.name, false, noone);
                var hh=element.height;
                break;
            case DataTypes.BOOL_ARRAY:     // bitfield
                var element=create_checkbox(spacing, yy, "<obsolete>", ew, eh, null, "", false, noone);
                var hh=element.height;
                break;
        }
        
        if (yy+hh>room_height-160){
            var n=ds_list_size(container.contents);
            col_data=instance_create((n/*+2*/)*cw+spacing, 0, UIThing);
            if (n>3){
                col_data.enabled=false;
            }
            ds_list_add(container.contents, col_data);
            element.y=yy_base;
            yy=yy_base;
        } else {
            yy=yy+hh+spacing;
        }
        
        ds_list_add(col_data.contents, element);
    }
}/*
show_message("end")
for (var i=0; i<ds_list_size(container.contents); i++){
    var c=container.contents[| i];
    for (var j=0; j<ds_list_size(c.contents); j++){
        show_message(c.contents[| j])
    }
}
