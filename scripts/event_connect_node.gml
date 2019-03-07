/// void event_connect_node(source, destination, [index]);

var index=0;
switch (argument_count){
    case 3:
        index=argument[2];
        break;
}

if (argument[1].parent!=noone){
    var old_index=ds_list_find_index(argument[1].parent.outbound, argument[1]);
    if (old_index>-1){
        argument[1].parent.outbound[| old_index]=noone;
    }
}

argument[1].parent=argument[0];
argument[0].outbound[| index]=argument[1];
