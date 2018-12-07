/// uivc_list_view_mesh(UIList);
// at this point, the list already knows what's been selected,
// it just behaves accordingly.

if (ds_map_size(argument0.selected_entries)==1){
    var data=Stuff.vra_data[? Stuff.all_mesh_names[| ds_map_find_first(argument0.selected_entries)]];
    argument0.root.el_bounds_xmin.text="  xmin: "+string(data[MeshArrayData.XMIN]);
    argument0.root.el_bounds_ymin.text="  ymin: "+string(data[MeshArrayData.YMIN]);
    argument0.root.el_bounds_zmin.text="  zmin: "+string(data[MeshArrayData.ZMIN]);
    argument0.root.el_bounds_xmax.text="  xmax: "+string(data[MeshArrayData.XMAX]);
    argument0.root.el_bounds_ymax.text="  ymax: "+string(data[MeshArrayData.YMAX]);
    argument0.root.el_bounds_zmax.text="  zmax: "+string(data[MeshArrayData.ZMAX]);
    argument0.root.el_preview.interactive=true;
} else {
    argument0.root.el_bounds_xmin.text="";
    argument0.root.el_bounds_ymin.text="";
    argument0.root.el_bounds_zmin.text="";
    argument0.root.el_bounds_xmax.text="";
    argument0.root.el_bounds_ymax.text="";
    argument0.root.el_bounds_zmax.text="";
    argument0.root.el_preview.interactive=false;
}
