struct VertexShaderInput {
    float4 Position : POSITION;
    float3 Normal : NORMAL;
    float4 Color : COLOR0;
    float2 Texcoord : TEXCOORD0;
};
 
struct VertexShaderOutput {
    float4 Position : SV_POSITION;
    float3 World : POSITION1;
    float3 Normal : NORMAL;
    float4 Color : COLOR0;
    float2 Texcoord : TEXCOORD0;
    float Fog : FOG;
};
 
uniform float3 FogRange;//(start, end, enabled) fog properties.
 
VertexShaderOutput main(VertexShaderInput IN){
    VertexShaderOutput OUT;
   
    float4 OutPosition = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.Position);
    float3 OutWorld = (mul(gm_Matrices[MATRIX_WORLD], IN.Position)).xyz;
    float3 OutNormal = (mul(gm_Matrices[MATRIX_WORLD], float4(IN.Normal,0.))).xyz;
    float  OutFog = (mul(gm_Matrices[MATRIX_WORLD_VIEW], IN.Position)).z;
   
    OUT.Position = OutPosition;
    OUT.World = OutWorld;
    OUT.Color = IN.Color;
    OUT.Texcoord = IN.Texcoord;
    OUT.Normal = OutNormal;
    OUT.Fog = clamp((OutFog-FogRange.x)/abs(FogRange.y-FogRange.x),0.,ceil(FogRange.z));
   
    return OUT;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~struct PixelShaderInput { //Input from Vertex shader
    float4 Position : SV_POSITION;
    float3 World : POSITION1;
    float3 Normal : NORMAL;
    float4 Color : COLOR0;
    float2 Texcoord : TEXCOORD0;
    float Fog : FOG;
};
 
 
static const int LN = 8; //max amount of point lights
static const int DL = 8; //max amount of directional lights
 
//Normal map texture and sampler
Texture2D normal_map : register(t1);
SamplerState normal_map_sampler : register(s1);
 
uniform float3 BackColor;//(r, g, b) background color.
uniform float PointPos[LN*4];//(x, y, z, range) point light position and radius.
uniform float PointCol[LN*3];//(r, g, b) point light color.
uniform float DirectDir[DL*3];//(x, y, z) directional light direction.
uniform float DirectCol[DL*3];//(r, g, b) directional light color.
uniform float3 FogColor;//(r, g, b) fog color.
uniform float Lambert;
 
float3 Point(float3 Position, float3 Normal, int Light)
{
    float3 D = float3(PointPos[Light*4],PointPos[Light*4+1],PointPos[Light*4+2])-Position;//Difference from light to fragment position.
    float3 C = float3(PointCol[Light*3],PointCol[Light*3+1],PointCol[Light*3+2]);//Light color.
    float L = length(D);//Distance from light to fragment position.
    float A = max(1.-L/PointPos[Light*4+3],0.);//Light attenaution.
 
    return C * A * pow(max(dot(Normal,D/L),0.),Lambert);//Multiply light color, attenuation and lambert lighting.
}
float3 Direct(float3 Normal, int Light)
{
    float3 N = normalize(float3(DirectDir[Light*3],DirectDir[Light*3+1],DirectDir[Light*3+2]));//Light direction.
    float3 C = float3(DirectCol[Light*3],DirectCol[Light*3+1],DirectCol[Light*3+2]);//Light color.
   
    return C * pow(max(dot(Normal,N),0.),Lambert);//Multiply light color and lambert lighting.
}
 
float4 main(PixelShaderInput INPUT) : SV_TARGET {
   
    float4 Color = INPUT.Color * tex2D(gm_BaseTexture, INPUT.Texcoord);//Pixel color.
   
    //Extract normal vector from normal map
    float3 Normal = normalize(tex2D(normal_map_sampler, INPUT.Texcoord).xyz*2.0 - 1.0);
    Normal.x = -Normal.x;
   
    // derivations of the fragment position
    float3 pos_dx = ddx(INPUT.World);
    float3 pos_dy = ddy(INPUT.World);
    // derivations of the texture coordinate
    float2 texC_dx = ddx(INPUT.Texcoord);
    float2 texC_dy = ddy(INPUT.Texcoord);
    // tangent vector and bitangent vector
    float3 Tangent = texC_dy.y * pos_dx - texC_dx.y * pos_dy;
    float3 Bitangent = normalize(cross(Tangent, INPUT.Normal));
    float3x3 TBN = float3x3(normalize(Tangent), normalize(Bitangent), INPUT.Normal);
   
    Normal = mul(Normal, TBN);
     
    float3 Lighting = float3(0.,0.,0.);
   
    //Add up the point lights.
    for(int I = 0;I < LN;I++)
    {
        Lighting += Point(INPUT.World,Normal,I);      
    }
    //Add up the directional lights.
    for(I = 0;I < DL;I++)
    {
        Lighting += Direct(Normal,I);      
    }
    return float4(lerp(Color.rgb*(Lighting+BackColor),FogColor,clamp(INPUT.Fog,0.,1.)),Color.a);
}
