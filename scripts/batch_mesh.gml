/// void batch_mesh(vertex buffer, wireframe buffer, EntityMesh);

var buffer=argument0;
var wire=argument1;
var mesh=argument2;

var xx=mesh.xx*TILE_WIDTH;
var yy=mesh.yy*TILE_HEIGHT;
var zz=mesh.zz*TILE_DEPTH;

var data=mesh.mesh_data[@ MeshArrayData.DATA];
buffer_seek(data, buffer_seek_start, 0);

var vc=0;

var px=array_create(3);
var py=array_create(3);
var pz=array_create(3);
var nx, ny, nz, xtex, ytex, color, alpha;

while (buffer_tell(data)<buffer_get_size(data)){
    // script arguments are parsed backwards and i don't think
    // there's a way to turn that off, and in any case it's a
    // better idea to just fetch the values first and *then*
    // pass them all to the script
    px[vc]=xx+buffer_read(data, T);
    py[vc]=yy+buffer_read(data, T);
    pz[vc]=zz+buffer_read(data, T);
    nx=buffer_read(data, T);
    ny=buffer_read(data, T);
    nz=buffer_read(data, T);
    xtex=buffer_read(data, T);
    ytex=buffer_read(data, T);
    color=buffer_read(data, T);
    alpha=buffer_read(data, T);
    
    vertex_point_complete(buffer, px[vc], py[vc], pz[vc], nx, ny, nz, xtex, ytex, color, alpha);
    
    vc=(++vc)%3;
    
    if (vc==0){
        vertex_point_line(wire, px[0], py[0], pz[0], c_white, 1);
        vertex_point_line(wire, px[1], py[1], pz[1], c_white, 1);
        
        vertex_point_line(wire, px[1], py[1], pz[1], c_white, 1);
        vertex_point_line(wire, px[2], py[2], pz[2], c_white, 1);
        
        vertex_point_line(wire, px[2], py[2], pz[2], c_white, 1);
        vertex_point_line(wire, px[0], py[0], pz[0], c_white, 1);
    }
}
