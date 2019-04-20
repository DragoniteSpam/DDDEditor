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
        // DataVersions.MOVE_ROUTE_MOVE_PARAMS
        case MoveRouteActions.MOVE_DOWN:
        case MoveRouteActions.MOVE_LEFT:
        case MoveRouteActions.MOVE_RIGHT:
        case MoveRouteActions.MOVE_UP:
        case MoveRouteActions.MOVE_LOWER_LEFT:
        case MoveRouteActions.MOVE_LOWER_RIGHT:
        case MoveRouteActions.MOVE_UPPER_LEFT:
        case MoveRouteActions.MOVE_UPPER_RIGHT:
            if (argument2>=DataVersions.MOVE_ROUTE_MOVE_PARAMS){
                var ext=buffer_read(argument0, buffer_u8);
                var data=array_compose(type, ext);
            } else {
                var data=array_compose(type, 1);
            }
            break;
        case MoveRouteActions.MOVE_JUMP:
            var map=buffer_read(argument0, buffer_string);
            var xx=buffer_read(argument0, buffer_u16);
            var yy=buffer_read(argument0, buffer_u16);
            var zz=buffer_read(argument0, buffer_u16);
            var dir=buffer_read(argument0, buffer_u8);
            var data=array_compose(type, map, xx, yy, zz, dir);
            break;
        case MoveRouteActions.MOVE_ACTUALLY_JUMP:
            var height=buffer_read(argument0, buffer_f32);
            var data=array_compose(type, height);
            break;
        case MoveRouteActions.WAIT:
            var t=buffer_read(argument0, buffer_f32);
            var data=array_compose(type, t);
            break;
        case MoveRouteActions.SWITCH_ON:
            var self_switch=buffer_read(argument0, buffer_u8);
            var data=array_compose(type, self_switch);
            break;
        case MoveRouteActions.SWITCH_OFF:
            var self_switch=buffer_read(argument0, buffer_u8);
            var data=array_compose(type, self_switch);
            break;
        case MoveRouteActions.CHANGE_SPEED:
            var spd=buffer_read(argument0, buffer_u8);
            var data=array_compose(type, spd);
            break;
        case MoveRouteActions.CHANGE_FREQUENCY:
            var frequency=buffer_read(argument0, buffer_u8);
            var data=array_compose(type, frequency);
            break;
        case MoveRouteActions.CHANGE_GRAPHIC:
            var graphic=buffer_read(argument0, buffer_u32);
            var data=array_compose(type, graphic);
            break;
        case MoveRouteActions.CHANGE_OPACITY:
            var alpha=buffer_read(argument0, buffer_f32);
            var data=array_compose(type, alpha);
            break;
        case MoveRouteActions.CHANGE_TINT:
            var color=buffer_read(argument0, buffer_u8);
            var data=array_compose(type, color);
            break;
        case MoveRouteActions.PLAY_SE:
            var sound=buffer_read(argument0, buffer_u32);
            var data=array_compose(type, sound);
            break;
        case MoveRouteActions.EVENT:
            var event=buffer_read(argument0, buffer_u32);
            var entrypoint=buffer_read(argument0, buffer_u32);
            var data=array_compose(type, event, entrypoint);
            break;
        default:
            var data=array_compose(type);
            break;
    }
    ds_list_add(route.steps, data);
}

move_route_update_buffer(route);
