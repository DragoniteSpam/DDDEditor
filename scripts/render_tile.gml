/// void render_tile(EntityTile);

var tile=argument0;
var TEXEL=1/sprite_get_width(tile.tileset);

var xx=tile.xx*TILE_WIDTH;
var yy=tile.yy*TILE_HEIGHT;
var zz=tile.zz*TILE_DEPTH;
// todo correct normal calculation, and MAYBE normal smoothing, although
// i'm pretty sure that's going to be really expensive unless you bake it
// into the likely future map editing tool
var nx=0;
var ny=0;
var nz=1;

// subject to change, and assuming each is square, which they don't have
// to be
var tile_size=32;

var tile_horizontal_count=sprite_get_width(tile.tileset)/tile_size;
var tile_vertical_count=sprite_get_height(tile.tileset)/tile_size;

// texture coordinates go from 0...1, not 0...n, where n is the dimension
// of the image in pixels
var texture_width=1/tile_horizontal_count;
var texture_height=1/tile_vertical_count;

var xtex=tile.tile_x*texture_width;
var ytex=tile.tile_y*texture_width;

var color=tile.tile_color;
var alpha=tile.tile_alpha;

d3d_primitive_begin_texture(pr_trianglelist, sprite_get_texture(tile.tileset, 0));

d3d_vertex_normal_texture_colour(xx, yy, zz, nx, ny, nz, xtex+TEXEL, ytex+TEXEL, color, alpha);
d3d_vertex_normal_texture_colour(xx+TILE_WIDTH, yy, zz, nx, ny, nz, xtex+texture_width-TEXEL, ytex+TEXEL, color, alpha);
d3d_vertex_normal_texture_colour(xx+TILE_WIDTH, yy+TILE_HEIGHT, zz, nx, ny, nz, xtex+texture_width-TEXEL, ytex+texture_height-TEXEL, color, alpha);

d3d_vertex_normal_texture_colour(xx+TILE_WIDTH, yy+TILE_HEIGHT, zz, nx, ny, nz, xtex+texture_width-TEXEL, ytex+texture_height-TEXEL, color, alpha);
d3d_vertex_normal_texture_colour(xx, yy+TILE_HEIGHT, zz, nx, ny, nz, xtex+TEXEL, ytex+texture_height-TEXEL, color, alpha);
d3d_vertex_normal_texture_colour(xx, yy, zz, nx, ny, nz, xtex+TEXEL, ytex+TEXEL, color, alpha);

d3d_primitive_end();

d3d_primitive_begin_texture(pr_linelist, -1);

d3d_vertex(xx, yy, zz);
d3d_vertex(xx+TILE_WIDTH, yy, zz);

d3d_vertex(xx+TILE_WIDTH, yy, zz);
d3d_vertex(xx+TILE_WIDTH, yy+TILE_HEIGHT, zz);

d3d_vertex(xx, yy, zz);
d3d_vertex(xx+TILE_WIDTH, yy+TILE_HEIGHT, zz);

d3d_vertex(xx+TILE_WIDTH, yy+TILE_HEIGHT, zz);
d3d_vertex(xx, yy+TILE_HEIGHT, zz);

d3d_vertex(xx, yy+TILE_HEIGHT, zz);
d3d_vertex(xx, yy, zz);

d3d_primitive_end();
