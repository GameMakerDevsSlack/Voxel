attribute vec2 in_TextureCoord;
attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec3 v_vLight;
varying vec3 v_vScoord;
varying vec4 v_vColour;
varying vec3 v_oNormal;
varying vec4 v_vCamPos;

uniform mat4 lightmatrix;

void main()
{
    vec4 object_space_pos = vec4( in_Position, 1.0);
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    vec4 norm = gm_Matrices[MATRIX_WORLD] * vec4( normalize( in_Normal ), 0.0 );
    vec4 pos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
    
    v_oNormal   = in_Normal;
    v_vTexcoord = in_TextureCoord;
    v_vLight    = (lightmatrix * norm).xyz;
    v_vScoord   = (lightmatrix * pos).xyz;
    v_vColour   = in_Colour;
    v_vCamPos   = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec3 v_vLight;
varying vec3 v_vScoord;
varying vec4 v_vColour;
varying vec3 v_oNormal;
varying vec4 v_vCamPos;

const float m = 16.0;
const float p = 3.141592653589793238462643;

uniform sampler2D depthmap;
uniform float depthsize;
uniform vec3 lightcol;
uniform vec4 ambcol;
uniform float mode;

float vtof(vec3 v)
{
    return (v.r*65536.0+v.g*256.0+v.b);
}
float hard( sampler2D depth, vec3 coord, vec2 size, float bias )
{
    vec4 c = vec4( floor( coord.xy * size.xy + 0.5) / size.xy, 1.0/size.xy );
    float d = vtof( texture2D( depth, c.xy ).rgb );

    return clamp((d-coord.z+bias)/bias,0.0,1.0);
}
void main()
{
    vec2 scoord = 0.5 * vec2( v_vScoord.x / v_vScoord.z + 1.0, 1.0 - v_vScoord.y / v_vScoord.z );
    float light = clamp( hard( depthmap, vec3( scoord, v_vScoord.z ), vec2( 1024.0 ), 1.0 ), 0.0, 1.0 );
    light = clamp( light * max(dot(vec3(0.0,0.0,-1.0),v_vLight),0.0),0.0,1.0)*max(1.0-length(scoord-vec2(0.5,0.5))*2.0,0.0);
    
    if ( mode == 0.0 ) {
        gl_FragColor = v_vColour * vec4( mix( ambcol.rgb, ambcol.rgb + lightcol, ambcol.a * light ), 1.0 );
    } else if ( mode == 1.0 ) {
        gl_FragColor = vec4( 1.0 - distance( v_vScoord, v_vLight ) / 500.0, 0.0, 0.0, 1.0 );
    } else if ( mode == 2.0 ) {
        gl_FragColor = vec4( normalize( v_vLight ) * 0.5 + 0.5, 1.0 );
    } else if ( mode == 3.0 ) {
        gl_FragColor = vec4( scoord, 0.0, 1.0 );
    } else if ( mode == 4.0 ) {
        vec4 c = vec4( floor( scoord * vec2( 1024.0 ) + 0.5 ) / vec2( 1024.0 ), 1.0/vec2( 1024.0 ) );
        gl_FragColor = vec4( texture2D( depthmap, c.xy ).rgb, 1.0 );
    } else {
        gl_FragColor = vec4( v_vCamPos.z/300.0, 0.0, 0.0, 1.0 );
    }
    
}
