/// void ui_render_bitfield_option_text_passability_mesh_passable(UIBitFieldOption, x, y);

// mesh data is stored in proto-objects represented by arrays, i have no idea why i made
// it like that but i did and now i have to deal with it
var data=Stuff.vra_data[? Stuff.all_mesh_names[| Camera.selection_fill_mesh]];
state=data[@ MeshArrayData.PASSAGE]==TILE_PASSABLE;

ui_render_bitfield_option_text(argument0, argument1, argument2);
