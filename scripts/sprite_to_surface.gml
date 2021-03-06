/// surface sprite_to_surface(sprite, subimg)
// by yellowafterlife

var q = argument0;
var qw = sprite_get_width(q);
var qh = sprite_get_height(q);
var qx = sprite_get_xoffset(q);
var qy = sprite_get_yoffset(q);

var t = surface_create(qw, qh);
surface_set_target(t);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_add);
draw_sprite(q, argument1, qx, qy);
draw_set_blend_mode(bm_normal);
surface_reset_target();

return t;
