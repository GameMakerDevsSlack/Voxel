struct a2v {
      float4 Position : POSITION;
      float2 Texcoord : TEXCOORD0;
      float3 Normal   : NORMAL;
};

struct v2p {
    float4 Position             : POSITION;
    float2 Texcoord             : TEXCOORD0;
    float  linearizedDepth      : DEPTH0;
    float3 Normal               : NORMAL0;
};

float3x3 inverse( float4x4 Original ) {
    float det =       Original[0][0] * Original[1][1] * Original[2][2]
                            + Original[0][1] * Original[1][2] * Original[2][0]
                            + Original[0][2] * Original[1][0] * Original[2][1]
                            - Original[0][0] * Original[1][2] * Original[2][1]
                            - Original[0][1] * Original[1][0] * Original[2][2]
                            - Original[0][2] * Original[1][1] * Original[2][0];
                        
    float inverse_determinant = 1.0 / det;
    
    float3x3 tmp;
    tmp[0][0] = Original[1][1] * Original[2][2] - Original[2][1] * Original[1][2];
    tmp[1][0] = Original[2][0] * Original[1][2] - Original[1][0] * Original[2][2];
    tmp[2][0] = Original[1][0] * Original[2][1] - Original[2][0] * Original[1][1];
    tmp[0][1] = Original[2][1] * Original[0][2] - Original[0][1] * Original[2][2];
    tmp[1][1] = Original[0][0] * Original[2][2] - Original[2][0] * Original[0][2];
    tmp[2][1] = Original[2][0] * Original[0][1] - Original[0][0] * Original[2][1];
    tmp[0][2] = Original[0][1] * Original[1][2] - Original[1][1] * Original[0][2];
    tmp[1][2] = Original[1][0] * Original[0][2] - Original[0][0] * Original[1][2];
    tmp[2][2] = Original[0][0] * Original[1][1] - Original[1][0] * Original[0][1];
    
    float3x3 Result;
    Result[0][0] = inverse_determinant * tmp[0][0];
    Result[1][0] = inverse_determinant * tmp[1][0];
    Result[2][0] = inverse_determinant * tmp[2][0];
    Result[0][1] = inverse_determinant * tmp[0][1];
    Result[1][1] = inverse_determinant * tmp[1][1];
    Result[2][1] = inverse_determinant * tmp[2][1];
    Result[0][2] = inverse_determinant * tmp[0][2];
    Result[1][2] = inverse_determinant * tmp[1][2];
    Result[2][2] = inverse_determinant * tmp[2][2];
    
    return transpose( Result );
}


uniform float uCameraFar;

void main(in a2v IN, out v2p OUT ) {

    // Diffuse
    OUT.Position    = mul( gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.Position );
    OUT.Texcoord    = IN.Texcoord;
    
    // Depth
    OUT.linearizedDepth = OUT.Position.z / uCameraFar;
    
    // Normal
    OUT.Normal      = normalize( mul( inverse( gm_Matrices[MATRIX_WORLD_VIEW] ), IN.Normal ) * float3( 1, 1, -1 ));
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~struct v2p {
    float4 Position             : POSITION;
    float4 Colour               : COLOR0;
    float2 Texcoord             : TEXCOORD0;
    float  linearizedDepth      : DEPTH0;
    float3 Normal               : NORMAL0;
};

struct p2s {
    float4 Colour0  : COLOR0;
    float4 Colour1  : COLOR1;
};

float3 packDepth(float f) {
    return float3( floor( f * 255.0 ) / 255.0, frac( f * 255.0 ), frac( f * 255.0 * 255.0 ) );
}

float4 packNormal( float3 Normal ){
    Normal = normalize( Normal );
    float3 shifted = (Normal+float3(1.0, 1.0, 1.0))/2.0;
    return  float4( shifted, 1.0 );
}

void main( in v2p IN, out p2s OUT ){

    // Alpha test
    float4 base = tex2D( gm_BaseTexture, IN.Texcoord );
    clip( (base.a <= 0.40)? -1:1 );
    
    // DEPTH
    OUT.Colour0 = float4( packDepth( IN.linearizedDepth ), 1.0 );
    
    // NORMAL
    OUT.Colour1 = packNormal( IN.Normal );
}
