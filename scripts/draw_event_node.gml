/// void draw_event_node(DataEventNode);
// Recursive

// color is set to black, font to FDefault12, alignment to left/middle
// if you change any of these in this script, you need to change them
// back when youre done

var x1=event_canvas_x+argument0.x;
var y1=event_canvas_y+argument0.y;
var x2=x1;
var y2=y1;

switch (argument0.type){
    case EventNodeTypes.ENTRYPOINT:
        x2=x1+32+string_width(argument0.name);
        y2=y1+16+string_height(argument0.name);
        draw_event_drag_handle(argument0, x1+16, y1-16, x2-16, y1+16, colour_mute(c_ev_init));
        draw_roundrect_colour(x1, y1, x2, y2, c_ev_init, c_ev_init, false);
        draw_roundrect(x1, y1, x2, y2, true);
        draw_text(x1+16, y1+16, argument0.name);
        break;
    case EventNodeTypes.TEXT:
        x2=x1+288;
        y2=y1+24+string_height(argument0.name)+string_height_ext(argument0.data[| 0], -1, 256);
        draw_event_drag_handle(argument0, x1+16, y1-16, x2-16, y1+16, colour_mute(c_ev_basic));
        draw_roundrect_colour(x1, y1, x2, y2, c_ev_basic, c_ev_basic, false);
        draw_roundrect(x1, y1, x2, y2, true);
        draw_sprite(spr_event_outbound, 2, x1, y1+16);
        draw_text(x1+16, y1+16, argument0.name);
        draw_text_ext(x1+16, mean(y1, y2)+16, argument0.data[| 0], -1, 256);
        
        draw_sprite(spr_event_delete, 0, x2, y1+16);
        break;
}

for (var i=0; i<ds_list_size(argument0.outbound); i++){
    var outbound=argument0.outbound[| i];
    
    var bx1=x2;
    var by1=mean(y1, y2);
    
    if (outbound==noone){
        draw_event_node_outbound(bx1, by1, argument0, i, true);
    } else {
        var bx2=event_canvas_x+outbound.x;
        var by2=event_canvas_y+outbound.y+16;
        
        draw_event_node_outbound(bx1, by1, argument0, i);
        draw_sprite(spr_event_dot, 0, bx1, by1);
        
        //draw_event_node(outbound);
        
        if (event_canvas_active_node!=argument0||event_canvas_active_node_index!=i){
            draw_bezier(bx1, by1, bx2, by2);
        }
    }
}

if (event_canvas_active_node==argument0){
    if (Controller.release_left){
        event_canvas_active_node=noone;
        event_canvas_active_node_index=0;
        // if the mouse is contacting another entrypoint, connect it
    }
    draw_bezier(bx1, by1, mouse_x, mouse_y);
}
