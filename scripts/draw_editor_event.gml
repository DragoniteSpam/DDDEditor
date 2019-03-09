// the surface needs to be drawn after the events, but processed before them
if (!surface_exists(event_controls_surface)){
    event_controls_surface=surface_create(320, room_height);
}

surface_set_target(event_controls_surface);

// DO NOT TOUCH THIS THANKS
d3d_set_projection_ortho(0, 0, 320, room_height, 0);

draw_clear(c_white);
draw_line(0, 0, 0, room_height);
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
surface_reset_target();

// we need to reset the d3d projection anyway when we're done with the surface because
// surfaces suck
d3d_set_projection_ortho(0, 0, room_width, room_height, 0);

draw_set_color(c_white);
draw_set_font(FDefault12);
draw_set_valign(fa_middle);

draw_clear(c_black);

var checker_width=sprite_get_width(b_tileset_checkers);
var checker_height=sprite_get_height(b_tileset_checkers);

draw_checkerbox(event_canvas_x%checker_width-checker_width, event_canvas_y%checker_height-checker_height,
    room_width+checker_width*2, room_height+checker_height*2);

draw_active_event();

if (Controller.mouse_right){
    window_set_cursor(cr_none);
    draw_scroll();
    
    event_canvas_x=event_canvas_x+mouse_x-Controller.mouse_x_previous;
    event_canvas_y=event_canvas_y+mouse_y-Controller.mouse_y_previous;
} else {
    window_set_cursor(cr_default);
}

draw_surface(event_controls_surface, room_width-320, 0);

draw_rectangle_colour(0, room_height-16, room_width, room_height, c_white, c_white, c_white, c_white, false);
draw_text_colour(16, room_height-8, "("+string(mouse_x+event_canvas_x)+", "+string(mouse_y+event_canvas_y)+")",
    c_black, c_black, c_black, c_black, 1);
