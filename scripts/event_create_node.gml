/// DataEventNode event_create_node(Event, EventNodeType, [x, y]);

// XVIEW and YVIEW won't work because this script may
// be called from a script other than view_fullscreen and
// that will make bad things happen
var xx=view_xview[view_fullscreen]+room_width/2;
var yy=view_yview[view_fullscreen]+room_height/2;

// requires 4, checks for 3+
if (argument_count>2){
    xx=argument[2];
    yy=argument[3];
}

var node=instance_create(xx, yy, DataEventNode);
node.event=argument[0];
node.type=argument[1];

switch (argument[1]){
    case EventNodeTypes.ENTRYPOINT:
        node.is_root=true;
        node.name="Entrypoint";
        break;
    case EventNodeTypes.TEXT:
        node.name="Text";
        break;
}

node.name=node.name+"\#"+string(ds_list_size(argument[0].nodes));

instance_deactivate_object(node);

ds_list_add(argument[0].nodes, node);

return node;
