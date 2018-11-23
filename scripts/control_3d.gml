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
        // Begin selection
        if (selection_empty()){
            if (under_cursor==noone){
                selection_start[vec3.zz]=0;
                selection_end[vec3.zz]=0;
            } else {
                selection_start[vec3.zz]=under_cursor.zz;
                selection_end[vec3.zz]=under_cursor.zz;
            }
            selection_start[vec3.xx]=floor_cx;
            selection_start[vec3.yy]=floor_cy;
            selection_end[vec3.xx]=floor_cx;
            selection_end[vec3.yy]=floor_cy;
        // Clear selection
        } else {
            selection_start=selection_clear();
            selection_end=selection_clear();
        }
    }
    if (mouse_check_button(mb_left)){
        if (!selection_empty()){
            selection_end[vec3.xx]=floor_cx;
            selection_end[vec3.yy]=floor_cy;
        }
    }
    if (mouse_check_button_released(mb_left)){
        // if the selection is empty and something has been
        // clicked on, select it instead of nothing
        if (selection_empty()){
            if (under_cursor!=noone){
                script_execute(under_cursor.selector, under_cursor);
            }
        }
    }
}

if (keyboard_check_pressed(vk_space)){
    sa_fill();
}

if (keyboard_check_pressed(vk_tab)){
    sa_invert();
}

if (keyboard_check_pressed(vk_delete)){
    sa_delete();
}
