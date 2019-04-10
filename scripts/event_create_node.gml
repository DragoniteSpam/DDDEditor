/// DataEventNode event_create_node(Event, EventNodeType, [x, y], [custom guid]);

// XVIEW and YVIEW won't work because this script may
// be called from a script other than view_fullscreen and
// that will make bad things happen
var xx=view_xview[view_fullscreen]+room_width/2;
var yy=view_yview[view_fullscreen]+room_height/2;
var custom_guid=0;

switch (argument_count){
    case 5:
        custom_guid=argument[4];
        if (!is_undefined(argument[2])){
            xx=argument[2];
        }
        if (!is_undefined(argument[3])){
            yy=argument[3];
        }
        break;
    case 4:
        xx=argument[2];
        yy=argument[3];
        break;
}

var node=instance_create(xx, yy, DataEventNode);
node.event=argument[0];
node.type=argument[1];

switch (argument[1]){
    case EventNodeTypes.ENTRYPOINT:
        node.is_root=true;
        node.name="Entrypoint";
        node.data[| 0]="";
        break;
    case EventNodeTypes.TEXT:
        node.name="Text";
        break;
    case EventNodeTypes.CUSTOM:
        node.custom_guid=custom_guid;
        node.name=guid_get(custom_guid).name;
        break;
}

// this used to be a # but that was screwing with game maker's newline
// thing because this version of game maker still used the stupid
// version of newlines
node.name=node.name+"$"+string(ds_list_size(argument[0].nodes));

instance_deactivate_object(node);

ds_list_add(argument[0].nodes, node);
ds_map_add(argument[0].name_map, node.name, node);

return node;
