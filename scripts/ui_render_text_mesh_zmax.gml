/// void ui_render_text_mesh_zmax(UIText, x, y);

var data=Stuff.vra_data[? Stuff.all_mesh_names[| Camera.selection_fill_mesh]];
argument0.text="zmax: "+string(data[@ MeshArrayData.ZMAX]);

ui_render_text(argument0, argument1, argument2);
