/// void ui_render_button_vrax(UIText, x, y);

if (string_length(Stuff.vra_name)==0){
    argument0.text="Load";
} else {
    argument0.text="Reload";
}
ui_render_button(argument0, argument1, argument2);
