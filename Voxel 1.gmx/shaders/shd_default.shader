attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vFog;

float CalcFogFactorB(vec4 pos)
{
    vec4 viewpos = gm_Matrices[MATRIX_WORLD_VIEW] * pos;
    float fogfactor = ((viewpos.z - gm_FogStart) * gm_RcpFogRange);
    return fogfactor;
}

vec4 DoDirLightB(vec3 ws_normal, vec4 dir, vec4 diffusecol)
{
    float dotresult = dot(ws_normal, dir.xyz);
    dotresult = max(0.0, dotresult);
    
    return dotresult * diffusecol;
}

vec4 DoPointLightB(vec3 ws_pos, vec3 ws_normal, vec4 posrange, vec4 diffusecol)
{
    vec3 diffvec = posrange.xyz - ws_pos;
    float veclen = length(diffvec);
    diffvec /= veclen;// normalise
      
    float atten = clamp( (1.0 - (veclen / posrange.w)), 0.0, 1.0);
    
    float dotresult = dot(ws_normal, diffvec);
    dotresult = max(0.0, dotresult);
    
    return dotresult * atten * diffusecol;
}


vec4 DoLightingB(vec4 vertexcolour, vec4 objectspacepos, vec3 objectspacenormal)
{
    vec4 objectspacenormal4 = vec4(objectspacenormal, 1.0);
    vec3 ws_normal = (gm_Matrices[MATRIX_WORLD] * objectspacenormal4).xyz;
    ws_normal = normalize(ws_normal);
    
    vec3 ws_pos = (gm_Matrices[MATRIX_WORLD] * objectspacepos).xyz;
    
    // Accumulate lighting from different light types
    vec4 accumcol = vec4(0.0, 0.0, 0.0, 1.0);
    for(int i = 0; i < MAX_VS_LIGHTS; i++)
        accumcol += DoDirLightB(ws_normal, gm_Lights_Direction[i], gm_Lights_Colour[i]);
    
    for(int i = 0; i < MAX_VS_LIGHTS; i++)
        accumcol += DoPointLightB(ws_pos, ws_normal, gm_Lights_PosRange[i], gm_Lights_Colour[i]);
    
    accumcol *= vertexcolour;
    accumcol += gm_AmbientColour;
    accumcol = min(vec4(1.0, 1.0, 1.0, 1.0), accumcol);
    
    return accumcol;
}


void main()
{
    vec4 object_space_pos = vec4( in_Position, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
     
    v_vColour = DoLightingB(in_Colour, object_space_pos, in_Normal);
    v_vTexcoord = in_TextureCoord;
    v_vFog = CalcFogFactorB(object_space_pos);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vFog;

void DoAlphaTestB(vec4 SrcColour)
{
    if (SrcColour.a <= gm_AlphaRefValue)
    {
    discard;
    }
}

void DoFogB(inout vec4 SrcColour, float fogval)
{
    SrcColour = mix(SrcColour, gm_FogColour, clamp(fogval, 0.0, 1.0)); 
}

void main()
{
    vec4 clr = v_vColour;// texture2D( gm_BaseTexture, v_vTexcoord );
    DoAlphaTestB(clr);
    DoFogB(clr, v_vFog);
    
    gl_FragColor = clr;
}
