/// void ui_render_image_button_autotile_preview(UIImageButton, x, y);

argument0.image=noone;
var index=ui_list_selection(argument0.root.el_list);

if (index!=noone){
    var data=Stuff.available_autotiles[index];
    if (is_array(data)){
        argument0.image=data[AvailableAutotileProperties.PICTURE];
    }
}

ui_render_image_button(argument0, argument1, argument2);
