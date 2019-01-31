//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

attribute int atid;                       // autotile id (zero if not an autotile)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float texoffset[];

// this shader doesn't compile, there's a bunch of things it doesn't like so just
// run it to get the full list

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    // the zeroth and first elements should be 0 and 0 because they get added to the
    // existing coordinates. no branching because shaders don't like branching.
    
    // the autotiles need to have their texture coordinates set to 0, 0 because they're
    // stored in the array instead of in the vertex buffer.
    v_vTexcoord = vec2(in_TextureCoord.x+texoffset[2*atid], in_TextureCoord.y+texoffset[2*atid+1]);
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

