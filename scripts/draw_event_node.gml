/// void draw_event_node(DataEventNode);
// Recursive

// color is set to black, font to FDefault12, alignment to left/middle
// if you change any of these in this script, you need to change them
// back when youre done

var x1=argument0.x;
var y1=argument0.y;
var x2=x1;
var y2=y1;

var entry_height=4*16+32;
var eh=0;
var tolerance=4;

switch (argument0.type){
    case EventNodeTypes.ENTRYPOINT:
        x2=x1+EVENT_NODE_CONTACT_WIDTH;
        y2=y1+16+string_height(argument0.name);
        
        if (rectangle_within_view(view_current, x1, y1, x2, y2)){
            var c=colour_mute(c_ev_init);
            draw_event_drag_handle(argument0, x1+16, y1-16, x2-16, y1+16, c);
            draw_roundrect_colour(x1, y1, x2, y2, c_ev_init, c_ev_init, false);
            draw_roundrect(x1, y1, x2, y2, true);
            draw_event_node_title(argument0, c);
            
            draw_event_node_delete(x2, y1, argument0);
        }
        break;
    case EventNodeTypes.TEXT:
        x2=x1+EVENT_NODE_CONTACT_WIDTH;
        //y2=y1+24+string_height(argument0.name)+string_height_ext(argument0.data[| 0], -1, EVENT_NODE_CONTACT_WIDTH-16);
        // the above will be very painful for nodes with many data entries because loops so just assume
        // each entry won't have more than four lines
        y2=y1+24+32+ds_list_size(argument0.data)*entry_height;
        
        if (rectangle_within_view(view_current, x1, y1, x2, y2)){
            var c=colour_mute(c_ev_basic);
            draw_event_drag_handle(argument0, x1+16, y1-16, x2-16, y1+16, c);
            draw_roundrect_colour(x1, y1, x2, y2, c_ev_basic, c_ev_basic, false);
            draw_roundrect(x1, y1, x2, y2, true);
            // this is the inbound node, which we don't really care about other than displaying
            // it so that the user knows which nodes can be attached to other nodes
            draw_sprite(spr_event_outbound, 2, x1, y1+16);
            draw_event_node_title(argument0, c);
            
            var entry_yy=y1+EVENT_NODE_CONTACT_HEIGHT;
            
            for (var i=0; i<ds_list_size(argument0.data); i++){
                draw_line(x1+16, entry_yy, x2-16, entry_yy);
                if (mouse_within_rectangle_view(x1+tolerance, entry_yy+tolerance, x2-tolerance, entry_yy+entry_height-tolerance)){
                    draw_rectangle_colour(x1+tolerance, entry_yy+tolerance, x2-tolerance, entry_yy+entry_height-tolerance, c, c, c, c, false);
                    if (get_release_left()){
                        argument0.data[| i]=get_string("Data in this node?", argument0.data[| i]);
                    }
                }
                
                draw_text_ext(x1+16, mean(entry_yy, entry_yy+entry_height), argument0.data[| i], -1, EVENT_NODE_CONTACT_WIDTH-16);
                var yy_center=mean(entry_yy, entry_yy+entry_height);
                if (i>0){
                    // this works out nicely because the outbound node is going to be in the same place at index 0,
                    // and the delete icon is going to be everywhere except index 0
                    draw_event_node_text_remove(x2, yy_center, argument0, i);
                    draw_event_node_text_move(x2, yy_center-24, argument0, i, -1, 0);
                }
                if (i<ds_list_size(argument0.data)-1){
                    draw_event_node_text_move(x2, yy_center+24, argument0, i, 1, 2);
                }
                
                entry_yy=entry_yy+entry_height;
            }
            
            if (mouse_within_rectangle_view(x1, y1, x2, y1+EVENT_NODE_CONTACT_HEIGHT)){
                if (get_release_left()){
                    argument0.name=get_string("Name of this node?", argument0.name);
                }
            }
            
            draw_event_node_delete(x2, y1, argument0);
            
            if (ds_list_size(argument0.outbound)<250){
                draw_event_node_text_add(mean(x1, x2), y2, argument0);
            }
        }
        break;
    case EventNodeTypes.CUSTOM:
        var custom=guid_get(argument0.custom_guid);
        x2=x1+EVENT_NODE_CONTACT_WIDTH;
        y2=y1+24+32;
        
        for (var i=0; i<ds_list_size(custom.types); i++){
            var type=custom.types[| i];
            switch (type[1]){
                case DataTypes.INT:
                case DataTypes.FLOAT:
                case DataTypes.BOOL:
                case DataTypes.ENUM:
                case DataTypes.DATA:
                    y2=y2+32;
                    break;
                case DataTypes.STRING:
                    y2=y2+entry_height;
                    break;
            }
        }
        
        if (rectangle_within_view(view_current, x1, y1, x2, y2)){
            var c=colour_mute(c_ev_custom);
            draw_event_drag_handle(argument0, x1+16, y1-16, x2-16, y1+16, c);
            draw_roundrect_colour(x1, y1, x2, y2, c_ev_custom, c_ev_custom, false);
            draw_roundrect(x1, y1, x2, y2, true);
            draw_sprite(spr_event_outbound, 2, x1, y1+16);
            draw_event_node_title(argument0, c);
            draw_event_node_delete(x2, y1, argument0);
            
            var entry_yy=y1+EVENT_NODE_CONTACT_HEIGHT;
            
            for (var i=0; i<ds_list_size(custom.types); i++){
                var custom_data_list=argument0.custom_data[| i];
                var type=custom.types[| i];
                
                switch (type[1]){
                    case DataTypes.INT:
                    case DataTypes.FLOAT:
                    case DataTypes.BOOL:
                    case DataTypes.ENUM:
                    case DataTypes.DATA:
                        eh=32;
                        break;
                    case DataTypes.STRING:
                        eh=entry_height;
                        break;
                }
                
                draw_line(x1+16, entry_yy, x2-16, entry_yy);
                if (mouse_within_rectangle_view(x1+tolerance, entry_yy+tolerance, x2-tolerance, entry_yy+eh-tolerance)){
                    draw_rectangle_colour(x1+tolerance, entry_yy+tolerance, x2-tolerance, entry_yy+eh-tolerance, c, c, c, c, false);
                    if (get_release_left()){
                        switch (type[1]){
                            case DataTypes.INT:
                                custom_data_list[| 0]=get_integer(type[0]+"?", custom_data_list[| 0]);
                                break;
                            case DataTypes.FLOAT:
                                var parse_me=get_string(type[0]+"?", string(custom_data_list[| 0]));
                                if (validate_double(parse_me)){
                                    custom_data_list[| 0]=real(parse_me);
                                }
                                break;
                            case DataTypes.STRING:
                                custom_data_list[| 0]=get_string(type[0]+"?", string(custom_data_list[| 0]));
                                break;
                            case DataTypes.BOOL:
                                custom_data_list[| 0]=!custom_data_list[| 0];
                                break;
                            case DataTypes.ENUM:
                            case DataTypes.DATA:
                                show_message("hang on");
                                break;
                        }
                    }
                }
                
                var message=type[0]+" ";
                
                if (ds_list_size(custom_data_list)==1){
                    switch (type[1]){
                        case DataTypes.INT:
                            message=message+"(int): "+string(custom_data_list[| 0]);
                            break;
                        case DataTypes.FLOAT:
                            message=message+"(float): "+string(custom_data_list[| 0]);
                            break;
                        case DataTypes.STRING:
                            message=message+"(string): "+custom_data_list[| 0];
                            break;
                        case DataTypes.BOOL:
                            message=message+"(boolean): "+Stuff.tf[custom_data_list[| 0]];
                            break;
                        case DataTypes.ENUM:
                        case DataTypes.DATA:
                            var datadata=guid_get(custom_data_list[| 0]);
                            if (datadata==noone){
                                message=message+"("+guid_get(type[2]).name+"): <null>";
                            } else {
                                message=message+": "+datadata.name;
                            }
                            break;
                    }
                } else {
                    message=message+": multiple values ("+string(ds_list_size(custom_data_list))+")";
                }
                
                draw_text_ext(x1+16, mean(entry_yy, entry_yy+eh), message, -1, EVENT_NODE_CONTACT_WIDTH-16);
                
                entry_yy=entry_yy+eh;
            }
        }
        break;
}

// different node types put the outbound nodes in different places - not all use more than
// one output node
switch (argument0.type){
    case EventNodeTypes.ENTRYPOINT:
        // vertical middle of the box
        var by=mean(y1, y2);
        var i=0;
        var outbound=argument0.outbound[| i];
        
        if (outbound==noone){
            draw_event_node_outbound(x2, by, argument0, i, true);
        } else {
            var bx2=outbound.x;
            var by2=outbound.y+16;
            
            draw_event_node_outbound(x2, by, argument0, i);
            draw_sprite(spr_event_dot, 0, x2, by);
            
            if (event_canvas_active_node!=argument0||event_canvas_active_node_index!=i){
                draw_bezier(x2+8, by, bx2-8, by2);
            }
        }
        break;
    case EventNodeTypes.TEXT:
    case EventNodeTypes.CUSTOM:
        // vertical middle of the first data entry
        var entry_yy=y1+EVENT_NODE_CONTACT_HEIGHT;
        var by=mean(entry_yy, entry_yy+entry_height);
        var i=0;
        var outbound=argument0.outbound[| i];
        
        if (outbound==noone){
            draw_event_node_outbound(x2, by, argument0, i, true);
        } else {
            var bx2=outbound.x;
            var by2=outbound.y+16;
            
            draw_event_node_outbound(x2, by, argument0, i);
            draw_sprite(spr_event_dot, 0, x2, by);
            
            if (event_canvas_active_node!=argument0||event_canvas_active_node_index!=i){
                draw_bezier(x2+8, by, bx2-8, by2);
            }
        }
        break;
    default:
        // not used now but keep it as a template for later
        for (var i=0; i<ds_list_size(argument0.outbound); i++){
            
        }
        break;
}

if (event_canvas_active_node==argument0){
    if (Controller.release_left){
        event_canvas_active_node=noone;
        event_canvas_active_node_index=0;
        // if the mouse is contacting another entrypoint, connect it
        var contacted_node=event_seek_node();
        if (contacted_node!=noone){
            event_connect_node(argument0, contacted_node);
        }
    }
    draw_bezier(x2+8, by, mouse_x_view, mouse_y_view);
}
