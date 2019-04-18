/// void ui_render_list_move_routes(UIList, x, y);

var oldentries=argument0.entries;
argument0.colorize=true;

argument0.entries=argument0.root.entity.movement_routes;
ds_list_clear(argument0.entry_colors);

for (var i=0; i<ds_list_size(argument0.entries); i++){
    if (argument0.entries[| i].GUID==argument0.root.entity.autonomous_movement_route){
        ds_list_add(argument0.entry_colors, c_blue);
    } else {
        ds_list_add(argument0.entry_colors, c_black);
    }
}

ui_render_list(argument0, argument1, argument2);

// no memory leak, although the list isn't used
argument0.entries=oldentries;
