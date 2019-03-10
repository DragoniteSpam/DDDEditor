/// void event_view_node(DataEventNode);
// snap the view to the specified node

// this will not be called from within view_fullscreen so
// you can't use the macros
view_xview[view_fullscreen]=floor(argument0.x-room_width/2);
view_yview[view_fullscreen]=floor(argument0.y-room_height/3);
