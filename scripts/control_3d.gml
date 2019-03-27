/// Select stuff with the mouse

if (!ActiveMap.is_3d){
    show_error("hey so yeah you haven't implemented the 2D controls yet, you probably should though", true);
}

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
    
    floor_cx=clamp(floor_x div TILE_WIDTH, 0, ActiveMap.xx);
    floor_cy=clamp(floor_y div TILE_HEIGHT, 0, ActiveMap.yy);
    
    if (Controller.press_left){
        if (!keyboard_check(input_selection_add)&&!selection_addition){
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
    if (Controller.mouse_left){
        if (last_selection!=noone){
            script_execute(last_selection.onmousedrag, last_selection, floor_cx, floor_cy);
        }
    }
    if (Controller.release_left){
        // selections of zero area are just deleted outright
        if (last_selection!=noone){
            if (script_execute(last_selection.area, last_selection)==0){
                instance_activate_object(last_selection);
                instance_destroy(last_selection);
                ds_list_pop(selection);
                last_selection=noone;
                sa_process_selection();
            }
        }
    }
}

var move_allowed=true;

if (keyboard_check_pressed(vk_space)){
    sa_fill();
}
if (keyboard_check_pressed(vk_delete)){
    sa_delete();
}

/*
 * General keyboard shortcuts
 */
if (keyboard_check(vk_control)){
    move_allowed=false;
    /*
     * file
     */
    if (keyboard_check_pressed(ord("N"))){
        momu_new(noone);
    }
    if (keyboard_check_pressed(ord("S"))){
        if (keyboard_check(vk_shift)){
            momu_save_data(noone);
        } else {
            momu_save_map(noone);
        }
    }
    if (keyboard_check_pressed(ord("O"))){
        momu_open(noone);
    }
    /*
     * edit
     */
    if (keyboard_check_pressed(ord("A"))){
        momu_select_all(noone);
    }
    if (keyboard_check_pressed(ord("D"))){
        momu_deselect(noone);
    }
    if (keyboard_check_pressed(ord("X"))){
        momu_cut(noone);
    }
    if (keyboard_check_pressed(ord("C"))){
        momu_copy(noone);
    }
    if (keyboard_check_pressed(ord("V"))){
        momu_paste(noone);
    }
    if (keyboard_check_pressed(ord("Z"))){
        momu_undo(noone);
    }
    if (keyboard_check_pressed(ord("Y"))){
        momu_redo(noone);
    }
}

// move the camera

if (move_allowed){
    var mspd=(min(log10(max(abs(z), 1))*4, 320)+1)/Stuff.dt;
    var xspeed=0;
    var yspeed=0;
    var zspeed=0;
    
    if (keyboard_check(vk_up)||keyboard_check(ord('W'))){
        xspeed=dcos(direction)*mspd*Stuff.dt;
        yspeed=-dsin(direction)*mspd*Stuff.dt;
        zspeed=-dsin(pitch)*mspd*Stuff.dt;
    }
    if (keyboard_check(vk_down)||keyboard_check(ord('S'))){
        xspeed=-dcos(direction)*mspd*Stuff.dt;
        yspeed=dsin(direction)*mspd*Stuff.dt;
        zspeed=dsin(pitch)*mspd*Stuff.dt;
    }
    if (keyboard_check(vk_left)||keyboard_check(ord('A'))){
        xspeed=-dsin(direction)*mspd*Stuff.dt;
        yspeed=-dcos(direction)*mspd*Stuff.dt;
    }
    if (keyboard_check(vk_right)||keyboard_check(ord('D'))){
        xspeed=dsin(direction)*mspd*Stuff.dt;
        yspeed=dcos(direction)*mspd*Stuff.dt;
    }
    if (Controller.mouse_middle){
        var dx=(MOUSE_X-CW/2)/16;
        var dy=(MOUSE_Y-CH/2)/16;
        direction=(360+direction-dx)%360;
        pitch=clamp(pitch+dy, -89, 89);
        window_mouse_set(CW/2, CH/2);
        xto=x+dcos(direction);
        yto=y-dsin(direction);
        zto=z-dsin(pitch);
    }
    
    x+=xspeed;
    y+=yspeed;
    z+=zspeed;
    xto+=xspeed;
    yto+=yspeed;
    zto+=zspeed;
    xup=0;
    yup=0;
    zup=1;
}
