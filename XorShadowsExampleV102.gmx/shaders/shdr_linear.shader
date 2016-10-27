attribute vec2 in_TextureCoord;            //(u,v)
attribute vec3 in_Position;                // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)

varying vec2 v_vTexcoord;
varying vec3 v_vLight;
varying vec3 v_vScoord;

uniform mat4 lightmatrix;

void main()
{
    vec4 object_space_pos = vec4( in_Position, 1.0);
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    vec4 norm = gm_Matrices[MATRIX_WORLD] * vec4( in_Normal,0.0);
    vec4 pos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
    v_vLight = (lightmatrix * norm).xyz;
    v_vScoord = (lightmatrix * pos).xyz;

}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec3 v_vLight;
varying vec3 v_vScoord;

const float m = 8.0;
const float p = 3.141592653589793238462643;

uniform sampler2D depthmap;
uniform float depthsize;
uniform vec3 lightcol;
uniform vec4 ambcol;

float vtof(vec3 v)
{
    return (v.r*65536.0+v.g*256.0+v.b);
}
float smooth(sampler2D depth,vec3 coord,vec2 size,float bias)
{
    vec4 c = vec4(floor(coord.xy*size.xy)/size.xy,1.0/size.xy);
    
    float d = vtof(texture2D(depth,c.xy).rgb)/16.0;
    float d1 = vtof(texture2D(depth,c.xy+c.wz*vec2(0.0)).rgb)/16.0;
    float d2 = vtof(texture2D(depth,c.xy+c.wz*vec2(1.0,0.0)).rgb)/16.0;
    float d3 = vtof(texture2D(depth,c.xy+c.wz*vec2(0.0,1.0)).rgb)/16.0;
    float d4 = vtof(texture2D(depth,c.xy+c.wz*vec2(1.0)).rgb)/16.0;

    float h1 = mix(clamp((d+(d1-d)-coord.z+bias)/bias,0.0,1.0),
    clamp((d+(d2-d)-coord.z+bias)/bias,0.0,1.0),fract((coord.x+c.z)*size.x));
    
    float h2 = mix(clamp((d+(d3-d)-coord.z+bias)/bias,0.0,1.0),
    clamp((d+(d4-d)-coord.z+bias)/bias,0.0,1.0),fract((coord.x+c.z)*size.x));
    
    return mix(h1,h2,fract((coord.y+c.w)*size.y));
}
void main()
{
    vec2 scoord = vec2(v_vScoord.x/v_vScoord.z+1.0,3.0-v_vScoord.y/v_vScoord.z)*0.5;
    
    float light = clamp(smooth(depthmap,vec3(scoord,v_vScoord.z),vec2(depthsize), 1024.0/depthsize),0.0,1.0);
    light = clamp(light * max(dot(vec3(0.0,0.0,-1.0),v_vLight),0.0),0.0,1.0)*max(1.0-length(scoord-vec2(0.5,1.5))*2.0,0.0);
    
    gl_FragColor = texture2D(gm_BaseTexture,v_vTexcoord) * vec4(mix(ambcol.rgb,ambcol.rgb+lightcol,ambcol.a*light),1.0);
}
