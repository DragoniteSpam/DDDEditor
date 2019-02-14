//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
// red = autotile id (zero if not an autotile)
// blue = na
// green = na
// alpha = na
attribute vec4 extra;                        

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const int maxpositions=12*16*8*2;
uniform float texoffset[maxpositions];

// this shader doesn't compile, there's a bunch of things it doesn't like so just
// run it to get the full list

void main(){
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    // the zeroth and first elements should be 0 and 0 because they get added to the
    // existing coordinates. no branching because shaders don't like branching.
    
    // the autotiles need to have their texture coordinates set to 0, 0 because they're
    // stored in the array instead of in the vertex buffer.
    int base=2*int(extra.r*float(maxpositions));
    base=0;
//    v_vTexcoord = vec2(in_TextureCoord.x+texoffset[base], in_TextureCoord.y+texoffset[base+1]);
    v_vTexcoord = vec2(in_TextureCoord.x+texoffset[0], in_TextureCoord.y+texoffset[1]);
    //v_vTexcoord = vec2(in_TextureCoord.x+0.0, in_TextureCoord.y+0.0);
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

