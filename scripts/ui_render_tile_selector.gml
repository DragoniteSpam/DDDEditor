/// void ui_render_tile_selector(UITileSelector, x, y);

var x1=argument0.x;
var y1=argument0.y;
var x2=argument0.x+argument0.width;
var y2=argument0.y+argument0.height;
var tex_width=sprite_get_width(ActiveMap.tileset);
var tex_height=sprite_get_height(ActiveMap.tileset);

draw_set_color(c_white);
draw_checkerbox(argument0.x, argument0.y, argument0.width, argument0.height);

draw_sprite_part(ActiveMap.tileset, 0, argument0.tile_view_x, argument0.tile_view_y,
    argument0.width, argument0.height, argument0.x, argument0.y);

for (var i=argument0.tile_view_x; i<argument0.tile_view_x+argument0.width; i=(i div Stuff.tile_size)*Stuff.tile_size+Stuff.tile_size){
    draw_line_colour(x1+i-argument0.tile_view_x, y1, x1+i-argument0.tile_view_x, y2, c_blue, c_blue);
}

for (var i=argument0.tile_view_y; i<argument0.tile_view_y+argument0.height; i=(i div Stuff.tile_size)*Stuff.tile_size+Stuff.tile_size){
    draw_line_colour(x1, y1+i-argument0.tile_view_y, x2, y1+i-argument0.tile_view_y, c_blue, c_blue);
}

// drawing the selection is a pain

var selx1=x1+Stuff.tile_size*Camera.selection_fill_tile_x-argument0.tile_view_x;
var sely1=y1+Stuff.tile_size*Camera.selection_fill_tile_y-argument0.tile_view_y;
var selx2=x1+Stuff.tile_size*(Camera.selection_fill_tile_x+1)-argument0.tile_view_x;
var sely2=y1+Stuff.tile_size*(Camera.selection_fill_tile_y+1)-argument0.tile_view_y;

draw_rectangle_colour(clamp(selx1, x1, x2), clamp(sely1, y1, y2), clamp(selx2, x1, x2), clamp(sely2, y1, y2),
    c_purple, c_purple, c_purple, c_purple, true);
draw_rectangle_colour(clamp(selx1+1, x1, x2), clamp(sely1+1, y1, y2), clamp(selx2-1, x1, x2), clamp(sely2-1, y1, y2),
    c_purple, c_purple, c_purple, c_purple, true);
draw_rectangle_colour(clamp(selx1-1, x1, x2), clamp(sely1-1, y1, y2), clamp(selx2+1, x1, x2), clamp(sely2+1, y1, y2),
    c_purple, c_purple, c_purple, c_purple, true);

draw_rectangle_colour(x1, y1, x2-1, y2-1, c_black, c_black, c_black, c_black, true);

// select a tile
if (Controller.press_left){
    if (mouse_within_rectangle(x1, y1, x2-1, y2-1)){
        Camera.selection_fill_tile_x=(Camera.MOUSE_X-x1+argument0.tile_view_x) div Stuff.tile_size;
        Camera.selection_fill_tile_y=(Camera.MOUSE_Y-y1+argument0.tile_view_y) div Stuff.tile_size;
    }
}
    
// pan around
if (Controller.mouse_right){
    if (argument0.offset_x>-1){
        argument0.tile_view_x=clamp(argument0.tile_view_x+argument0.offset_x-Camera.MOUSE_X, 0, tex_width-argument0.width);
        argument0.tile_view_y=clamp(argument0.tile_view_y+argument0.offset_y-Camera.MOUSE_Y, 0, tex_height-argument0.height);
    }
    if (argument0.offset_x>-1||mouse_within_rectangle(x1, y1, x2-1, y2-1)){
        argument0.offset_x=Camera.MOUSE_X;
        argument0.offset_y=Camera.MOUSE_Y;
    }
} else {
    argument0.offset_x=-1;
    argument0.offset_y=-1;
}

// do the manual scroll bars (horizontal and vertical) next
// this will require an increase to the maximum clamped values on lines 51 and 52 if you want the scroll
// bars to not overlap the bottom-most/rightmost row on the tileset

/*var x1=argument0.x+argument1;
var y1=argument0.y+argument2;
var x2=x1+argument0.width;
var y2=y1+argument0.height;

var tx=ui_get_text_x(argument0, x1, x2);
var ty=ui_get_text_y(argument0, y1, y2);

// this is not quite the same as ui_render_text
draw_set_halign(argument0.alignment);
draw_set_valign(argument0.valignment);
draw_set_color(argument0.color);
draw_text(tx+32, ty, argument0.text);

var s2=8;

if (!argument0.interactive){
    draw_rectangle_colour(tx+16-s2, ty-s2, tx+16+s2, ty+s2, c_ltgray, c_ltgray, c_ltgray, c_ltgray, true);
}
draw_rectangle(tx+16-s2, ty-s2, tx+16+s2, ty+s2, true);

if (argument0.value){
    if (argument0.interactive){
        var a=1;
    } else {
        var a=0.5;
    }
    draw_sprite_ext(spr_check, 0, tx+16, ty, 1, 1, 0, c_white, a);
}

if (argument0.interactive&&dialog_is_active(argument0.root)&&mouse_within_rectangle(x1, y1, x2, y2)){
    if (get_release_left()){
        argument0.value=!argument0.value;
        script_execute(argument0.onvaluechange, argument0);
    }
}
