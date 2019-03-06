d3d_set_projection_ortho(0, 0, room_width, room_height, 0);

draw_set_color(c_white);
draw_set_font(FDefault12);
draw_set_valign(fa_middle);

draw_clear(c_black);

var checker_width=sprite_get_width(b_tileset_checkers);
var checker_height=sprite_get_height(b_tileset_checkers);

draw_checkerbox(event_canvas_x%checker_width-checker_width, event_canvas_y%checker_height-checker_height,
    room_width+checker_width*2, room_height+checker_height*2);

if (Controller.mouse_middle){
    window_set_cursor(cr_none);
    draw_sprite(spr_scroll, 0, mouse_x, mouse_y);
    
    event_canvas_x=event_canvas_x+mouse_x-Controller.mouse_x_previous;
    event_canvas_y=event_canvas_y+mouse_y-Controller.mouse_y_previous;
} else {
    window_set_cursor(cr_default);
}

if (Controller.press_left){
    event_canvas_select_x_start=mouse_x-event_canvas_x;
    event_canvas_select_y_start=mouse_y-event_canvas_y;
    event_canvas_select_x_end=event_canvas_select_x_start;
    event_canvas_select_y_end=event_canvas_select_y_start;
}

if (Controller.mouse_left){
    event_canvas_select_x_end=mouse_x-event_canvas_x;
    event_canvas_select_y_end=mouse_y-event_canvas_y;
    draw_set_alpha(0.5);
    draw_rectangle_colour(event_canvas_x+event_canvas_select_x_start,
        event_canvas_y+event_canvas_select_y_start,
        event_canvas_x+event_canvas_select_x_end,
        event_canvas_y+event_canvas_select_y_end,
        c_gray, c_gray, c_gray, c_gray, false);
    draw_rectangle_colour(event_canvas_x+event_canvas_select_x_start,
        event_canvas_y+event_canvas_select_y_start,
        event_canvas_x+event_canvas_select_x_end,
        event_canvas_y+event_canvas_select_y_end,
        c_black, c_black, c_black, c_black, true);
    draw_set_alpha(1);
}

draw_rectangle_colour(0, room_height-16, room_width, room_height, c_white, c_white, c_white, c_white, false);
draw_text_colour(16, room_height-8, "("+string(mouse_x+event_canvas_x)+", "+string(mouse_y+event_canvas_y)+")",
    c_black, c_black, c_black, c_black, 1);
