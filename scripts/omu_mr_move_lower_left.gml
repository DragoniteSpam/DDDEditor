/// void omu_mr_move_lower_left(UIThing);

if (ds_list_size(argument0.root.route.steps)<255){
    ds_list_add(argument0.root.route.steps, array_compose(MoveRouteActions.MOVE_LOWER_LEFT, 1));
    move_route_update_buffer(argument0.root.route);
}
