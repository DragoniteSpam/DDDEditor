/// void omu_mr_direction_fix_off(UIThing);

if (ds_list_size(argument0.root.route.steps)<255){
    ds_list_add(argument0.root.route.steps, array_compose(MoveRouteActions.DIRECTION_FIX_OFF));
}
