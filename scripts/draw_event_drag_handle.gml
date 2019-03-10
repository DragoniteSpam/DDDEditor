/// void draw_event_drag_handle(DataEventNode, x1, y1, x2, y2, color);

draw_roundrect_colour(argument1, argument2, argument3, argument4, argument5, argument5, false);
draw_roundrect(argument1, argument2, argument3, argument4, true);

// i don't like this but it works
if (mouse_within_rectangle_view(argument1, argument2, argument3, argument4)||argument0.offset_x>-1){
    if (get_press_left()){
        argument0.offset_x=mouse_x_view-argument0.x;
        argument0.offset_y=mouse_y_view-argument0.y;
    } else if (Controller.mouse_left){
        if (argument0.offset_x>-1){
            argument0.x=mouse_x_view-argument0.offset_x;
            argument0.y=mouse_y_view-argument0.offset_y;
        }
    } else {
        argument0.offset_x=-1;
        argument0.offset_y=-1;
    }
} else {
    argument0.offset_x=-1;
    argument0.offset_y=-1;
}

// i don't like this either but it also works
if (mouse_within_rectangle_view(argument1, argument2, argument3, argument4)){
    if (get_release_right()){
        var new_name=get_string("New name for this node?", argument0.name);
        if (ds_map_exists(argument0.event.name_map, new_name)){
            show_message(new_name+" is already in use!");
        } else {
            ds_map_delete(argument0.event.name_map, argument0.name);
            ds_map_add(argument0.event.name_map, new_name, argument0);
            argument0.name=new_name;
        }
    }
}
