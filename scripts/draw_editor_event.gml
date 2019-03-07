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

draw_rectangle_colour(0, room_height-16, room_width, room_height, c_white, c_white, c_white, c_white, false);
draw_text_colour(16, room_height-8, "("+string(mouse_x+event_canvas_x)+", "+string(mouse_y+event_canvas_y)+")",
    c_black, c_black, c_black, c_black, 1);
