/// void ui_init_event();

with (instance_create(0, 0, UIMain)){
    /*
     * tab system setup
     */
    
    t_events=create_tab("Events", 0, id);
    t_list=create_tab("Node List", 0, id);
    t_data=create_tab("Node Data", 0, id);
    t_action1=create_tab("Actions1", 1, id);
    t_action2=create_tab("Actions2", 1, id);
    
    var tr=ds_list_create();
    ds_list_add(tr, t_events, t_list, t_data);
    
    ds_list_add(tabs, tr);
    
    var tr=ds_list_create();
    ds_list_add(tr, t_action1, t_action2);
    
    ds_list_add(tabs, tr);
    
    active_tab=t_events;
    
    // there is only enough space for one column
    
    var element;
    var spacing=16;
    var legal_x=room_width-view_hud_width_event+32;
    var legal_y=128;
    var element_width=view_hud_width_event-96;
    // element_height is an object variable that's already been defined
    
    /*
     * Node list
     */
    
    var yy=legal_y;
    
    element=create_text(legal_x+spacing, yy, "", element_width, element_height, fa_left, element_width, t_list);
    element.render=ui_render_text_active_node;
    ds_list_add(t_list.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_list(legal_x+spacing, yy, "Event Nodes", "No nodes available!", element_width, spacing, 32, uivc_list_selection_event_node, false, t_list);
    element.entries_are=ListEntries.INSTANCES;
    element.render=ui_render_list_event_node;
    ds_list_add(t_list.contents, element);
    
    yy=yy+element_height+spacing+element.height*element.slots;
    
    element=create_text(legal_x+spacing, yy, "Quick Add", element_width, element_height, fa_left, element_width, t_list);
    ds_list_add(t_list.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_button(legal_x+spacing, yy, "Entrypoint", element_width, element_height, fa_left, omu_event_add_entrypoint, t_list);
    ds_list_add(t_list.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_button(legal_x+spacing, yy, "Text Node", element_width, element_height, fa_left, omu_event_add_text, t_list);
    ds_list_add(t_list.contents, element);
    
    /*
     * Node data
     */
    
    var yy=legal_y;
    
    element=create_text(legal_x+spacing, yy, "", element_width, element_height, fa_left, element_width, t_list);
    element.render=ui_render_text_active_node;
    ds_list_add(t_data.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_text(legal_x+spacing, yy, "I'm not actually sure what's going to go here, but I'm reserving it in case I run out of space in the first tab.",
        element_width, element_height, fa_left, element_width, t_data);
    ds_list_add(t_data.contents, element);
    
    /*
     * Event list
     */
    
    var yy=legal_y;
    
    element=create_text(legal_x+spacing, yy, "", element_width, element_height, fa_left, element_width, t_list);
    element.render=ui_render_text_active_node;
    ds_list_add(t_events.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_list(legal_x+spacing, yy, "All Events", "No events!", element_width, spacing, 32, uivc_list_selection_event, false, t_events);
    element.entries_are=ListEntries.INSTANCES;
    element.render=ui_render_list_event;
    ds_list_add(t_events.contents, element);
    
    t_events.el_event_list=element;
    
    yy=yy+element_height+spacing+element.height*element.slots;
    
    element=create_button(legal_x+spacing, yy, "Add Event", element_width, element_height, fa_left, omu_event_add_event, t_events);
    ds_list_add(t_events.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_button(legal_x+spacing, yy, "Rename", element_width, element_height, fa_left, omu_event_rename_event, t_events);
    ds_list_add(t_events.contents, element);
    
    yy=yy+element_height+spacing;
    
    element=create_button(legal_x+spacing, yy, "Delete", element_width, element_height, fa_left, omu_event_remove_event, t_events);
    ds_list_add(t_events.contents, element);
    
    yy=yy+element_height+spacing;
    
    return id;
}
