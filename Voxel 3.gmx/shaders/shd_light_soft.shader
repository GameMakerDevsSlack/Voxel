attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

varying vec3 v_vLight;
varying vec3 v_vScoord;
varying vec4 v_vColour;

uniform mat4 lightmatrix;

void main()
{
    vec4 object_space_pos = vec4( in_Position, 1.0);
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    vec4 norm = gm_Matrices[MATRIX_WORLD] * vec4( in_Normal,0.0);
    vec4 pos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
    
    v_vLight    = (lightmatrix * norm).xyz;
    v_vScoord   = (lightmatrix * pos).xyz;
    v_vColour   = in_Colour;

}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec3 v_vLight;
varying vec3 v_vScoord;
varying vec4 v_vColour;

const float m = 2.0;
const float p = 3.141592653589793238462643;

uniform sampler2D depthmap;
uniform float depthsize;
uniform vec3 lightcol;
uniform vec4 ambcol;
uniform float uCameraFar;

float vtof(vec3 v) {
    return (v.r*65536.0+v.g*256.0+v.b);
}

float getDepth( vec3 colourRGB ){
    return uCameraFar * clamp(float((colourRGB.r)+(colourRGB.g/255.0)+(colourRGB.b/(255.0*255.0))), 0.0, 1.0);
}

float smooth(sampler2D depth,vec3 coord,vec2 size,float bias) {
    vec4 c = vec4(floor(coord.xy*size.xy)/size.xy,1.0/size.xy);
    
    float d1 = vtof(texture2D(depth,c.xy+c.wz*vec2(0.0)).rgb);
    float d2 = vtof(texture2D(depth,c.xy+c.wz*vec2(1.0,0.0)).rgb);
    float d3 = vtof(texture2D(depth,c.xy+c.wz*vec2(0.0,1.0)).rgb);
    float d4 = vtof(texture2D(depth,c.xy+c.wz*vec2(1.0)).rgb);

    float h1 = mix(clamp((d1-coord.z+bias)/bias,0.0,1.0),
    clamp((d2-coord.z+bias)/bias,0.0,1.0),fract((coord.x+c.z)*size.x));
    
    float h2 = mix(clamp((d3-coord.z+bias)/bias,0.0,1.0),
    clamp((d4-coord.z+bias)/bias,0.0,1.0),fract((coord.x+c.z)*size.x));
    
    return mix(h1,h2,fract((coord.y+c.w)*size.y));
}

float shadow(sampler2D depth,vec3 coord,vec2 size,float bias) {
    float total;
    
    for(float i = 0.0; i < m; i += 2.0 ) {
        total += smooth( depth, vec3( coord.xy + vec2( cos( (i+0.5)/m*p ), sin( (i+0.5)/m*p ) ) / size*2.0, coord.z ), size, bias );
        total += smooth( depth, vec3( coord.xy + vec2( cos(  i     /m*p ), sin(  i     /m*p ) ) / size    , coord.z ), size, bias );
    }
    
    return total/m;
}

float hard( sampler2D depth, vec3 coord, vec2 size, float bias ) {
    vec4 c = vec4( floor( coord.xy * size.xy + 0.5) / size.xy, 1.0/size.xy );
    float d = vtof( texture2D( depth, c.xy ).rgb )/16.0;

    return clamp((d-coord.z+bias)/bias,0.0,1.0);
}

void main() {
    vec2 scoord = vec2(v_vScoord.x/v_vScoord.z+1.0,1.0-v_vScoord.y/v_vScoord.z)*0.5;
    
    float light = clamp(smooth(depthmap,vec3(scoord,v_vScoord.z),vec2(depthsize), 1024.0/depthsize),0.0,1.0);
    light = clamp( light * max(dot(vec3(0.0,0.0,-1.0),v_vLight),0.0),0.0,1.0)*max(1.0-length(scoord-vec2(0.5,0.5))*2.0,0.0);
    
    gl_FragColor = v_vColour * vec4(mix(ambcol.rgb,ambcol.rgb+lightcol,ambcol.a*light),1.0);
    
}
