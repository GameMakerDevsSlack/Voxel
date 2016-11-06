//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;

void main() {
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

uniform sampler2D depth_buffer;
uniform sampler2D normal_buffer;
uniform float uSSAOResolution;
uniform vec2 uScreenResolution;
uniform vec2 uPixelCheck;

#define DEPTH_SENSITIVITY 20.0
#define SAMPLES 4

// Get Depth Value
float getDepth( vec3 colourRGB ){
    return clamp(float((colourRGB.r)+(colourRGB.g/255.0)+(colourRGB.b/(255.0*255.0))), 0.0, 1.0);
}

// Get Normal Value
vec3 unpackNormal( vec4 colour) {
    return normalize(colour.xyz*2.0 - 1.0);
}

void main() {
    float centerDepth = getDepth( texture2D( depth_buffer,  v_vTexcoord ).rgb );
    vec3 centerNormal = unpackNormal( texture2D( normal_buffer, v_vTexcoord ) );
    
    // Turn the pixel into a texel. As depth increases, the radius decreases.
    float iDepth = 1.0 - centerDepth;
    vec2 texelCheck = (uPixelCheck / uScreenResolution) * (iDepth);
    
    // Setup blur weights ( Gamemaker wouldn't let us do it in a 1-liner >:[ )
    float weights[SAMPLES + 1];
    weights[0] = 1.0;
    weights[1] = 8.0;
    weights[2] = 28.0;
    weights[3] = 56.0;
    weights[4] = 70.0; // Center pixel
    
    float ssao = texture2D( gm_BaseTexture, v_vTexcoord ).r * weights[ SAMPLES ];
    float totalWeight = weights[ SAMPLES ];
    
    // Sample dis crap
    for (int i = 0; i < SAMPLES; i+=1) {
    
        // Get the sample uv coordinates
        vec2 sampleOffset = float( i + 1 ) * texelCheck;
        
        
        // Positive direction
        vec2 sampleCoords = v_vTexcoord + sampleOffset;
        float sampleDepth  = getDepth(  texture2D( depth_buffer,  sampleCoords ).rgb );
        vec3 sampleNormal = unpackNormal( texture2D( normal_buffer, sampleCoords) ); 
        float weight = max(0.0, dot(centerNormal, sampleNormal) - abs(sampleDepth - centerDepth) * DEPTH_SENSITIVITY) * weights[(SAMPLES - 1) - i];
        ssao += texture2D(gm_BaseTexture, sampleCoords).r * weight;
        totalWeight += weight;
        
        
        
        // Negative direction
        sampleCoords = v_vTexcoord - sampleOffset;
        sampleDepth  = getDepth(  texture2D( depth_buffer,  sampleCoords ).rgb );
        sampleNormal = unpackNormal( texture2D( normal_buffer, sampleCoords) );
        weight = max(0.0, max(0.0, dot(centerNormal, sampleNormal)*0.8 + 0.2) - abs(sampleDepth - centerDepth) * DEPTH_SENSITIVITY) * weights[(SAMPLES - 1) - i];
        ssao += texture2D(gm_BaseTexture, sampleCoords).r * weight;
        totalWeight += weight;
    }

    gl_FragColor = vec4( vec3(ssao / totalWeight), 1.0);
}

