/// void omu_entity_remove_move_route_step(UIThing);

var index=ui_list_selection(argument0.root.el_steps);
var list=argument0.root.route.steps;

if (index>-1&&show_question("Do you really want to delete the current movement step?")){
    ds_list_delete(list, index);
    ui_list_deselect(argument0.root.el_steps);
    argument0.root.el_steps.index=min(ds_list_size(argument0.root.el_steps.entries)-argument0.root.el_steps.slots-1, argument0.root.el_steps.index);
}
