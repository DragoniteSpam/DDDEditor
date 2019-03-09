/// void ui_init_event();

with (instance_create(0, 0, UIMain)){
    ui_x=0;
    ui_y=0;
    ui_width=320;
    ui_height=room_height;
    /*
     * tab system setup
     */
    
    t_list=create_tab("Node List", 0, id);
    t_data=create_tab("Data", 0, id);
    
    var tr=ds_list_create();
    ds_list_add(tr, t_list, t_data);
    
    ds_list_add(tabs, tr);
    
    active_tab=t_list;
    
    /*
    draw_text(16, 48, "All Nodes");
// make this a scrolling list later
for (var i=0; i<min(ds_list_size(Stuff.active_event.nodes), 20); i++){
    var xx=16;
    var yy=80+i*16;
    var node=Stuff.active_event.nodes[| i];
    if (point_in_rectangle(mouse_x-room_width+320, mouse_y, xx, yy-8, xx+320-32, yy+7)){
        draw_rectangle_colour(xx, yy-8, xx+320-32, yy+8, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        
        if (get_release_left()){
            // Not sure why this is the negative of what I would have expected but okay
            event_canvas_x=-node.x+320;
            event_canvas_y=-node.y+room_height/2;
        }
    }
    draw_text(xx+16, yy, node.name);
}
draw_rectangle(16, 64, 320-16, 64+20*16, true);
*/
    return id;
}
