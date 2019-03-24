/// void ui_render_list_event_node(UIList, x, y);

var oldentries=argument0.entries;
argument0.entries=Stuff.active_event.nodes;
argument0.colorize=false;

ui_render_list(argument0, argument1, argument2);

// no memory leak, although the list isn't used
argument0.entries=oldentries;
