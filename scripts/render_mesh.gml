/// void render_mesh(EntityMesh);

var mesh=argument0;
var xx=mesh.xx;
var yy=mesh.yy;
var zz=mesh.zz;

transform_set(xx*TILE_WIDTH, yy*TILE_HEIGHT, zz*TILE_DEPTH, 0, 0, 0, 1, 1, 1);

if (Camera.view_entities){
    if (Camera.view_texture){
        var tex=sprite_get_texture(ActiveMap.tileset.picture, 0);
    } else {
        var tex=sprite_get_texture(b_tileset_textureless, 0)
    }
    
    vertex_submit(mesh.mesh_data[@ MeshArrayData.VBUFF], pr_trianglelist, tex);
}

if (Camera.view_wireframe){
    vertex_submit(mesh.mesh_data[@ MeshArrayData.VBUFF_WIREFRAME], pr_linelist, -1);
}

transform_reset();
