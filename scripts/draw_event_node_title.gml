/// void draw_event_node_title(DataEventNode);

var x1=argument0.x+event_canvas_x;
var y1=argument0.y+event_canvas_y;
var x2=argument0.x+event_canvas_x+EVENT_NODE_CONTACT_WIDTH;
var y2=argument0.y+event_canvas_y+EVENT_NODE_CONTACT_HEIGHT;

draw_text(x1+16, mean(y1, y2), argument0.name);
draw_line(x1+16, y2, x2-16, y2);
