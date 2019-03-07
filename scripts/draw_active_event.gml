/// void draw_active_event();

if (Stuff.active_event!=noone){
    draw_set_font(FDefault12);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    
    draw_event_node(Stuff.active_event.entrypoint);
}
