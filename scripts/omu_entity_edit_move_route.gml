/// void omu_entity_edit_move_route(UIThing);

var index=ui_list_selection(argument0.root.el_move_routes);
var list=argument0.root.entity.movement_routes;

if (index>-1){
    dialog_create_entity_move_route(argument0.root, argument0.root.entity.movement_routes[| index]);
}
