/// void serialize_save_events(buffer);

buffer_write(argument0, buffer_datatype, SerializeThings.EVENTS);

var n_events=ds_list_size(Stuff.all_events);
buffer_write(argument0, buffer_u32, n_events);

for (var i=0; i<n_events; i++){
    var event=Stuff.all_events[| i];
    var n_nodes=ds_list_size(event.nodes);
    buffer_write(argument0, buffer_string, event.name);
    buffer_write(argument0, buffer_u32, event.GUID);        // DataVersions.EVENT_GUID
    buffer_write(argument0, buffer_u32, n_nodes);
    
    for (var j=0; j<n_nodes; j++){
        var node=event.nodes[| j];
        buffer_write(argument0, buffer_string, node.name);
        buffer_write(argument0, buffer_u16, node.type);
        buffer_write(argument0, buffer_u32, floor(node.x));
        buffer_write(argument0, buffer_u32, floor(node.y));
        
        var n_outbound=ds_list_size(node.outbound);
        buffer_write(argument0, buffer_u8, n_outbound);
        for (var k=0; k<n_outbound; k++){
            buffer_write(argument0, buffer_string, node.data[| k]);
            if (node.outbound[| k]==noone){
                // empty string signifies a terminal node
                buffer_write(argument0, buffer_string, "");
            } else {
                buffer_write(argument0, buffer_string, node.outbound[| k].name);
            }
        }
        
        // if there's anything special in the node, save it here
        switch (node.type){
            case EventNodeTypes.ENTRYPOINT:
            case EventNodeTypes.TEXT:
                break;
        }
    }
}
