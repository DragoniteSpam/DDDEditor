/// void uivc_select_mesh_refresh(index);

// refresh values that don't like to do it on their own
var data=Stuff.vra_data[? Stuff.all_mesh_names[| Camera.selection_fill_mesh]];

Camera.ui.t_p_mesh.element_tag.value=string(data[@ MeshArrayData.TAGS]);
