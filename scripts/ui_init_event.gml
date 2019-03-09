/// void ui_init_event();

with (instance_create(0, 0, UIMain)){
    /*
     * tab system setup
     */
    
    t_list=create_tab("Node List", 0, id);
    t_data=create_tab("Node Data", 0, id);
    
    var tr=ds_list_create();
    ds_list_add(tr, t_list, t_data);
    
    ds_list_add(tabs, tr);
    
    active_tab=t_list;
    
    // there is only enough space for one column
    
    var element;
    var spacing=16;
    var legal_x=room_width-view_hud_width_event+32;
    var legal_y=128;
    var element_width=view_hud_width_event-96;
    
    /*
     * Node list
     */
    
    var yy=legal_y+spacing;
    
    element=create_list(legal_x+spacing, yy, "Event Nodes", "No nodes available!", element_width, spacing, 32, uivc_list_selection_event_node, false, t_list);
    element.entries_are_instances=true;
    element.render=ui_render_list_event_node;
    ds_list_add(t_list.contents, element);
    
    /*
     * Node data
     */
    
    yy=legal_y+spacing;
    
    element=create_text(legal_x+spacing, yy, "I'm not actually sure what's going to go here, but I'm reserving it in case I run out of space in the first tab.",
        element_width, element_height, fa_left, element_width, t_data);
    ds_list_add(t_data.contents, element);
    
    return id;
}
