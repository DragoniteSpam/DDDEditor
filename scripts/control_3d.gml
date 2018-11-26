/// Select stuff with the mouse

mouse_vector=update_mouse_vector(x, y, z, xto, yto, zto, xup, yup, zup, fov, CW/CH);

var xx=mouse_vector[vec3.xx]*MILLION;
var yy=mouse_vector[vec3.yy]*MILLION;
var zz=mouse_vector[vec3.zz]*MILLION;

if (c_raycast_world(x, y, z, x+xx, y+yy, z+zz, ~0)){
    under_cursor=c_object_get_userid(c_hit_object(0));
} else {
    under_cursor=noone;
}

var floor_x=-1;
var floor_y=-1;
var floor_cx=-1;
var floor_cy=-1;

if (zz<z){
    var f=abs(z/zz);
    floor_x=x+xx*f;
    floor_y=y+yy*f;
    
    floor_cx=clamp(floor_x div Stuff.tile_width, 0, ActiveMap.xx);
    floor_cy=clamp(floor_y div Stuff.tile_height, 0, ActiveMap.yy);
    
    if (mouse_check_button_pressed(mb_left)){
        if (!keyboard_check_direct(input_selection_add)&&!selection_addition){
            selection_clear();
        }
        switch (selection_mode){
            case SelectionModes.SINGLE:
                var stype=SelectionSingle;
                break;
            case SelectionModes.RECTANGLE:
                var stype=SelectionRectangle;
                break;
            case SelectionModes.CIRCLE:
                var stype=SelectionCircle;
                break;
        }
        
        if (under_cursor==noone){
            var tz=0;
        } else {
            var tz=under_cursor.zz;
        }
        
        last_selection=instance_create(0, 0, stype);
        ds_list_add(selection, last_selection);
        script_execute(last_selection.onmousedown, last_selection, floor_cx, floor_cy, tz);
    }
    if (mouse_check_button(mb_left)){
        if (last_selection!=noone){
            script_execute(last_selection.onmousedrag, last_selection, floor_cx, floor_cy);
        }
    }
}

if (keyboard_check_pressed(vk_space)){
    sa_fill();
}

if (keyboard_check_pressed(vk_delete)){
    sa_delete();
}
