/// void ui_render_list_event_custom(UIList, x, y);

var oldentries=argument0.entries;
argument0.entries=Stuff.all_event_custom;

ui_render_list(argument0, argument1, argument2);

// no memory leak, although the list isn't used
argument0.entries=oldentries;
