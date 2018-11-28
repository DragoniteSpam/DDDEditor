/// void dr_box(Dialog);

var header_height=32;

var x1=argument0.x;
var y1=argument0.y;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

var active=dialog_is_active(argument0);
var kill=keyboard_check_released(vk_escape);

draw_rectangle_colour(x1, y1, x2, y2, c_white, c_white, c_white, c_white, false);
draw_rectangle_colour(x1, y1, x2, y2, c_black, c_black, c_black, c_black, true);

draw_line_colour(x1, y1+header_height, x2, y1+header_height, c_black, c_black);

var tx=x1+32;
var ty=y1+header_height/2;

var cbs=sprite_get_width(spr_close)/2;
var cbx=x2-cbs;
var cby=ty;
var cbi=2;

draw_text(tx, ty, argument0.text);

if (active){
    cbi=0;
    if (mouse_within_rectangle(x1, y1, x2, y1+header_height)){
        if (Controller.press_left){
            argument0.cmx=Camera.MOUSE_X;
            argument0.cmy=Camera.MOUSE_Y;
        }
        if (Controller.release_left){
            argument0.cmx=-1;
            argument0.cmy=-1;
        }
        var cbx1=cbx-cbs;
        var cby1=cby-cbs;
        var cbx2=cbx+cbs;
        var cby2=cby+cbs;
        if (mouse_within_rectangle(cbx1, cby1, cbx2, cby2)){
            cbi=1;
            if (Controller.release_left){
                Controller.release_left=false;
                kill=true;
            }
        }
    }
    
    if (Controller.mouse_left&&argument0.cmx>-1){
        var dx=Camera.MOUSE_X-argument0.cmx;
        var dy=Camera.MOUSE_Y-argument0.cmy;
        argument0.x=argument0.x+dx;
        argument0.y=argument0.y+dy;
        argument0.cmx=Camera.MOUSE_X;
        argument0.cmy=Camera.MOUSE_Y;
        // if i wasn't so lazy i'd just make some kind of transform group
        // thing and not have to manually update the position of the contents
        // every time the dialog moves, but i didn't think that far ahead
        // and it's not actually worth updating all that code
        for (var i=0; i<ds_list_size(argument0.contents); i++){
            var thing=argument0.contents[| i];
            thing.x=thing.x+dx;
            thing.y=thing.y+dy;
        }
    }
}

draw_sprite(spr_close, cbi, cbx, cby);

for (var i=0; i<ds_list_size(argument0.contents); i++){
    var thing=argument0.contents[| i];
    script_execute(thing.render, thing);
}

// the x button/escape key does not commit changes
if (kill){
    dialog_destroy();
}
