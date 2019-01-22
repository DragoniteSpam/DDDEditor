/// uivc_bitfield_mesh_passability(UIThing);

// mesh data is stored in proto-objects represented by arrays, i have no idea why i made
// it like that but i did and now i have to deal with it
var data=Stuff.vra_data[? Stuff.all_mesh_names[| Camera.selection_fill_mesh]];
data[@ MeshArrayData.PASSAGE]=data[@ MeshArrayData.PASSAGE]^argument0.value;
