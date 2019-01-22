/// void ui_render_bitfield_option_text_mesh_flag(UIBitFieldOption, x, y);

var data=Stuff.vra_data[? Stuff.all_mesh_names[| Camera.selection_fill_mesh]];
state=data[@ MeshArrayData.FLAGS]&argument0.value;

ui_render_bitfield_option_text(argument0, argument1, argument2);
