/// void omu_mr_turn_toward_player(UIThing);

if (ds_list_size(argument0.root.route.steps)<255){
    ds_list_add(argument0.root.route.steps, array_compose(MoveRouteActions.TURN_TOWARD_PLAYER));
}
