/// background tileset_create_composite(tileset);

var surface=surface_create(TEXTURE_SIZE, TEXTURE_SIZE);

surface_set_target(surface);

surface_reset_target();

var back=background_create_from_surface(surface, 0, 0, TEXTURE_SIZE, TEXTURE_SIZE, false, false);
surface_free(surface);

return back;
