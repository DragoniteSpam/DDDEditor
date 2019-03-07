/// DataEventNode event_create_node(EventNodeType, x, y);

var node=instance_create(argument1, argument2, DataEventNode);
node.type=argument0;
instance_deactivate_object(node);

return node;
