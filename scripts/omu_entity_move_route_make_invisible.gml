/// void omu_entity_move_route_make_invisible(UIThing);

var index=ui_list_selection(argument0.root.el_move_routes);
var list=argument0.root.entity.movement_routes;

if (index>-1){
    move_route_make_invisible(argument0.root.entity, list[| index]);
}
