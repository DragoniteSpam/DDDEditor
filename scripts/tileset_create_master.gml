/// sprite tileset_create_master(tileset);

var surface=surface_create(TEXTURE_SIZE, TEXTURE_SIZE);

surface_set_target(surface);

/*
 * draw stuff
 */

draw_sprite(argument0.picture, 0, argument0.picture_position[vec2.xx]*TEXTURE_SIZE, argument0.picture_position[vec2.yy]*TEXTURE_SIZE);
for (var i=0; i<AUTOTILE_MAX; i++){
    if (argument0.autotiles[i]!=noone){
        var atp=argument0.autotile_positions[i];
        draw_sprite(argument0.autotiles[i], 0, atp[vec2.xx]*TEXTURE_SIZE, atp[vec2.yy]*TEXTURE_SIZE);
    }
}

/*
 * administrative stuff
 */

surface_reset_target();

var back=sprite_create_from_surface(surface, 0, 0, TEXTURE_SIZE, TEXTURE_SIZE, false, false, 0, 0);
surface_free(surface);

return back;
