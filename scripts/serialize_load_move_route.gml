/// void serialize_load_move_route(buffer, Entity, version);

var route=instance_create(0, 0, DataMoveRoute);
ds_list_add(argument1.movement_routes, route);

serialize_load_generic(argument0, route, argument2);

var bools=buffer_read(argument0, buffer_u16);

route.repeat_action=unpack(bools, 0);
route.skip=unpack(bools, 1);
route.wait=unpack(bools, 2);

var n_steps=buffer_read(argument0, buffer_u16);

repeat(n_steps){
    var type=buffer_read(argument0, buffer_u16);
    
    switch (type){
        case MoveRouteActions.MOVE_DOWN:
        case MoveRouteActions.MOVE_LEFT:
        case MoveRouteActions.MOVE_RIGHT:
        case MoveRouteActions.MOVE_UP:
            ds_list_add(route.steps, array_compose(type));
            break;
    }
}
