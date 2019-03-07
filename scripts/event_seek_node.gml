/// DataEventNode event_seek_node();
// Checks to see if there's a node under the mouse position

for (var i=0; i<ds_list_size(Stuff.active_event.nodes); i++){
    var node=Stuff.active_event.nodes[| i];
    if (point_in_rectangle(mouse_x, mouse_y, node.x+Camera.event_canvas_x, node.y+Camera.event_canvas_y,
        node.x+EVENT_NODE_CONTACT_WIDTH+Camera.event_canvas_x, node.y+EVENT_NODE_CONTACT_HEIGHT+Camera.event_canvas_y)){
        return node;
    }
}

return noone;
