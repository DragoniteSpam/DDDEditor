/// void draw_event_node_outbound(x, y, node, index, [terminal?]);

if (argument_count==5&&argument[4]){
    draw_sprite(spr_event_outbound, 0, argument[0], argument[1]);
} else {
    draw_sprite(spr_event_outbound, 1, argument[0], argument[1]);
}

if (mouse_within_rectangle(argument[0]-8, argument[1]-8, argument[0]+8, argument[1]+8)&&Controller.press_left){
    Camera.event_canvas_active_node=argument[2];
    Camera.event_canvas_active_node_index=argument[3];
}
