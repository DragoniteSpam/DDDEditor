/// ui_init_game_data();

// this one's not tabbed, it's just a bunch of elements floating in space
with (instance_create(0, 0, UIThing)){
    var columns=5;
    var ew=(room_width-columns*32)/columns;
    var eh=24;
    
    var vx1=room_width/(columns*2)-16;
    var vy1=0;
    var vx2=vx1+room_width/(columns*2)-16;
    var vy2=vy1+eh;
    
    var b_width=128;
    var b_height=32;
    
    var spacing=16;
    var n_slots=14;
    
    var yy_header=48;
    var yy=64;
    var yy_base=yy;
    var element;
    
    var buffer_x=16;
    
    /*
     * header things
     */
    
    var this_column=1;
    
    element=create_text(this_column*ew+buffer_x, yy_header, "Data Name", ew, eh, fa_left, ew, id);
    element.render=ui_render_text_data_name;
    ds_list_add(contents, element);
    
    /*
     * the list on the side is pretty important
     */
    
    var this_column=0;
    
    element=create_list(this_column*ew+buffer_x, yy_header, "All Game Data Types: ", "Click to define some", ew, eh, 32, uivc_list_data_editor, false, id);
    element.render=ui_render_list_data_data;
    element.entries_are=ListEntries.INSTANCES;
    ds_list_add(contents, element);
    
    /*
     * contents
     */
    
    var yy=yy_base+spacing;
    
    /*
     * more important stuff that needs to be done
     */
    
    active_type_guid=0;
    
    return id;
}
