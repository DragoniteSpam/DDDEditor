/// void ui_render_list_entity_events(UIList, x, y);

var list=selection_all();

if (ds_list_size(list)==1){
    var oldentries=argument0.entries;
    argument0.entries=list[| 0].object_events;
} // else please don't add anything to the list

ui_render_list(argument0, argument1, argument2);

if (ds_list_size(list)==1){
    argument0.entries=oldentries;
}
