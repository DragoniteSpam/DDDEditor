/// void event_connect_node(source, destination, [index]);

var index=0;
switch (argument_count){
    case 3:
        index=argument[2];
        break;
}

argument[0].outbound[| index]=argument[1];
