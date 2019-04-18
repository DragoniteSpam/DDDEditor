/// void serialize_save_move_route(buffer, DataMoveRoute);

// name, guid, flags
serialize_save_generic(argument0, argument1);

var bools=pack(argument1.repeat_action,
    argument1.skip,
    argument1.wait);

buffer_write(argument0, buffer_u16, bools);

var n_steps=ds_list_size(argument1.steps);
buffer_write(argument0, buffer_u16, n_steps);

for (var i=0; i<n_steps; i++){
    var step=argument1.steps[| i];
    
    buffer_write(argument0, buffer_u16, step[@ 0]);
    switch(step[@ 0]){
        case MoveRouteActions.MOVE_DOWN:
        case MoveRouteActions.MOVE_LEFT:
        case MoveRouteActions.MOVE_RIGHT:
        case MoveRouteActions.MOVE_UP:
            break;
    }
}
