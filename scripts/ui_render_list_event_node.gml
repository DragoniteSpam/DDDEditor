/// void ui_render_list_event_node(UIList, x, y);

var oldentries=argument0.entries;
argument0.entries=Stuff.active_event.nodes;

ui_render_list(argument0, argument1, argument2);

argument0.entries=oldentries;
