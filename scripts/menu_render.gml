/// void menu_render(MenuMenu, x, y);

var x1=argument1;
var y1=argument2;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

argument0.x=x1;
argument0.y=y1;

var tx=ui_get_text_x(argument0);
var ty=mean(y1, y2);

// click on the header
if (mouse_within_rectangle(x1, y1, x2, y2)){
    draw_rectangle_colour(x1, y1, x2, y2, c_ui, c_ui, c_ui, c_ui, false);
    if (Controller.release_left){
        Controller.release_left=false;
        if (argument0.root.active_element!=noone){
            argument0.root.active_element.active=false;
        }
        argument0.root.active_element=argument0;
        argument0.active=true;
    }
}

draw_set_halign(argument0.alignment);
draw_set_color(argument0.color);
draw_text(tx, ty, argument0.text);

if (argument0.active){
    var separation=16;
    var ww=separation*2;
    for (var i=0; i<ds_list_size(argument0.contents); i++){
        ww=max(ww, string_width(argument0.contents[| i].text)+separation*2);
    }
    var hh=argument0.height*ds_list_size(argument0.contents)+separation*2;
    var xx=x1;
    if (xx+ww>CW){
        xx=CW-ww;
    }
    draw_rectangle_colour(xx, y2, xx+ww, y2+hh, c_white, c_white, c_white, c_white, false);
    for (var i=0; i<ds_list_size(argument0.contents); i++){
        var thing=argument0.contents[| i];
        var mx1=xx;
        var my1=y2+argument0.height*i+separation
        var mx2=mx1+ww;
        var my2=my1+argument0.height;
        if (mouse_within_rectangle(mx1, my1, mx2, my2-1)){  // the -1 is so you can't hover over two elements at the same time
            draw_rectangle_colour(mx1, my1, mx2, my2, c_ui, c_ui, c_ui, c_ui, false);
            if (Controller.release_left){
                Controller.release_left=false;
                script_execute(thing.onmouseup, thing);
            }
            // todo expand the thing
        }
        draw_text(mx1+16, mean(my1, my2), thing.text);
        if (thing.active){
            script_execute(thing.render, thing);
        }
    }
}
