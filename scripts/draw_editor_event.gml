var controller_left=Controller.mouse_left;
var controller_right=Controller.mouse_right;
var controller_middle=Controller.mouse_middle;

var controller_press_left=Controller.press_left;
var controller_press_right=Controller.press_right;
var controller_press_middle=Controller.press_middle;

var controller_release_left=Controller.release_left;
var controller_release_right=Controller.release_right;
var controller_release_middle=Controller.release_middle;

// There are other ways to do this, but disable controller (mouse) input if
// the mouse isn't in the view

if (!mouse_within_view(view_fullscreen)){
    Controller.mouse_left=false;
    Controller.mouse_right=false;
    Controller.mouse_middle=false;
    
    Controller.press_left=false;
    Controller.press_right=false;
    Controller.press_middle=false;
    
    Controller.release_left=false;
    Controller.release_right=false;
    Controller.release_middle=false;
}

d3d_set_projection_ortho(0, 0, view_wview[view_fullscreen], view_hview[view_fullscreen], 0);

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

draw_rectangle_colour(0, room_height-16, room_width, room_height, c_white, c_white, c_white, c_white, false);
draw_text_colour(16, room_height-8, "Canvas at ("+string(mouse_x+event_canvas_x)+", "+string(mouse_y+event_canvas_y)+
    "); mouse at ("+string(mouse_x+event_canvas_x)+", "+string(mouse_y+event_canvas_y)+")",
    c_black, c_black, c_black, c_black, 1);

// Reset controller input

if (!mouse_within_view(view_fullscreen)){
    Controller.mouse_left=controller_left;
    Controller.mouse_right=controller_right;
    Controller.mouse_middle=controller_middle;
    
    Controller.press_left=controller_press_left;
    Controller.press_right=controller_press_right;
    Controller.press_middle=controller_press_middle;
    
    Controller.release_left=controller_release_left;
    Controller.release_right=controller_release_right;
    Controller.release_middle=controller_release_middle;
}
