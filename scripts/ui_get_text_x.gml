/// double ui_get_text_x(UIText);

switch (argument0.alignment){
    case fa_left:
        return argument0.x+argument0.height/2;
        break;
    case fa_center:
        return argument0.x+argument0.width/2;
        break;
    case fa_right:
        return argument0.x+argument0.width-argument0.height/2;
        break;
}
