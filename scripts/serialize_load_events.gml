/// void serialize_load_events(buffer, version);

var version=argument1;
var n_events=buffer_read(argument0, buffer_u32);

Stuff.active_event=noone;

repeat(n_events){
    var event_name=buffer_read(argument0, buffer_string);
    var event=event_create(event_name);
    ds_list_add(Stuff.all_events, event);
    // events are created with an entrypoint by default - you could pass an optional
    // parameter to the constructor to have it not do this, but this is the only place
    // where it's going to happen, so there's not really a point
    instance_destroy(event.nodes[| 0]);
    ds_list_clear(event.nodes);
    
    var connections=ds_list_create();
    
    var n_nodes=buffer_read(argument0, buffer_u32);
    repeat(n_nodes){
        var node_name=buffer_read(argument0, buffer_string);
        var node_type=buffer_read(argument0, buffer_u16);
        var node_x=buffer_read(argument0, buffer_u32);
        var node_y=buffer_read(argument0, buffer_u32);
        var node=event_create_node(event, node_type, node_x, node_y);
        node.name=node_name;
        node.event=event;
        
        // some preliminary data may be created
        ds_list_clear(node.data);
        // don't clear outbound - it's noone anyway, and if outbound.size == 0,
        // bad things happen
        
        // node connections are stored until all of the nodes (and their names)
        // have been read out of the file
        
        var node_connections=ds_list_create();
        ds_list_add(connections, node_connections);
        
        var n_outbound=buffer_read(argument0, buffer_u8);
        repeat(n_outbound){
            ds_list_add(node.data, buffer_read(argument0, buffer_string));
            ds_list_add(node_connections, buffer_read(argument0, buffer_string));
        }
        
        // special code for different node types
        switch (node_type){
            case EventNodeTypes.ENTRYPOINT:
                // is_root is set in the constructor already
            case EventNodeTypes.TEXT:
                break;
        }
        
        // don't add the node to event.nodes because it already does it for you
        // in the constructor (how nice)
    }
    
    for (var i=0; i<n_nodes; i++){
        var node=event.nodes[| i];
        var node_connection=connections[| i];
        
        for (var j=0; j<ds_list_size(node_connection); j++){
            if (string_length(node_connection[| j])>0){
                event_connect_node(node, event_get_node(event, node_connection[| j]), j);
            }
        }
        
        ds_list_destroy(node_connection);
    }
    
    ds_list_destroy(connections);
}

// by default, set the 0th event as the active event
if (ds_list_empty(Stuff.all_events)){
    ds_list_add(all_events, event_create("DefaultEvent"));
}

Stuff.active_event=Stuff.all_events[| 0];
