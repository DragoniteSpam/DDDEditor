/// DataEventNode event_create_node(Event, EventNodeType, x, y);

var node=instance_create(argument2, argument3, DataEventNode);
node.event=argument0;
node.type=argument1;
instance_deactivate_object(node);

return node;
