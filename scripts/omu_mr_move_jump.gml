/// void omu_mr_move_jump(UIThing);

if (ds_list_size(argument0.root.route.steps)<255){
    ds_list_add(argument0.root.route.steps, array_compose(MoveRouteActions.MOVE_JUMP, "MAP", 0, 0, 0, 0));
}
