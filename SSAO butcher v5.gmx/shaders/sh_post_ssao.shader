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

//######################_==_YOYO_SHADER_MARKER_==_######################@~// Do not change samples unless you change it in SSAO_INIT!
#define SAMPLES 16

varying vec2 v_vTexcoord;

uniform sampler2D depth_buffer;
uniform sampler2D normal_buffer;
uniform sampler2D noise_buffer;

uniform float uCameraNear;
uniform float uCameraFar;

uniform mat4 uInverseProjectionMatrix;
uniform mat4 uProjectionMatrix;

uniform vec2 uScreenDimension;

uniform vec2  uSSAOKernel[SAMPLES];
uniform float uSSAORadius;
uniform float uSSAOStrength;
uniform float uSSAOPower;

// Get Depth Value
float getDepth( vec3 colourRGB ){
    return clamp(float((colourRGB.r)+(colourRGB.g/255.0)+(colourRGB.b/(255.0*255.0))), 0.0, 1.0);
}



// Get Normal Value
vec3 unpackNormal( vec3 colour) {
    return normalize(colour.xyz*2.0 - 1.0);
}



// Reconstruct Position From Depth
vec3 reconstructPosition( vec2 texCoord ) {
    // Calculate out of the fragment in screen space the view space position.
    float xx = texCoord.s * 2.0 - 1.0;
    float yy = texCoord.t * 2.0 - 1.0;
    float zz = getDepth( texture2D(depth_buffer, texCoord).rgb );

    vec4 posView = uInverseProjectionMatrix * vec4(xx, yy, zz, 1.0);
    posView /= posView.w;
    return posView.xyz;
}



// Calculate SSAO
void main() {
    
    // Information about the current screen-pixel
    float depth         = getDepth( texture2D(depth_buffer, v_vTexcoord).rgb );
    float realDepth     = depth * uCameraFar;
    vec3 depthPosition  = reconstructPosition( v_vTexcoord );
    vec3 normal         =  unpackNormal( texture2D( normal_buffer, v_vTexcoord).rgb );
    
    // Calculate adjusted SSAO radius
    float offsetScale   = uSSAORadius / realDepth;
    
    // Calculate Noise
    vec2 noiseScale     = uScreenDimension/4.0;
    vec2 noiseVector    = normalize( texture2D( noise_buffer, v_vTexcoord * noiseScale).xy * 2.0 - 1.0);
    
    // Get Aspect Ratio
    float iAspectRatio  = uScreenDimension.y / uScreenDimension.x;
    
    // Do the SSAO calculation
    float occlusion         = 0.0;
    float samplesOccluded   = 0.0;
    
    for ( int i = 0; i < SAMPLES; i++ ) {
        // Get sample position
        vec2 offset          = reflect(uSSAOKernel[i], noiseVector) * offsetScale;
        offset.x            *= iAspectRatio;
        vec2 sampleCoords    = v_vTexcoord + offset;
        
        // Test if Samplecoords are inside the actual texture-range
        float TEXCHECK      = (sampleCoords.x >= 0.0 && sampleCoords.x <= 1.0 && sampleCoords.y >= 0.0 && sampleCoords.y <= 1.0 ) ? 1.0 : 0.0;
        samplesOccluded    += TEXCHECK;
        
        vec3 sample         = reconstructPosition( sampleCoords );
        vec3 sampleNormal   = unpackNormal( texture2D( normal_buffer, sampleCoords).rgb );
        
        // Calculate check variables
        vec3 normalDifference = sampleNormal - normal;
        float normalCheck     = abs(normalDifference.x) + abs(normalDifference.y) + abs(normalDifference.z);
        float depthCheck      = (depthPosition.z >= sample.z) ? 1.0 : 0.0;
        float rangeCheck      = (abs(depthPosition.z - sample.z) * uCameraFar < uSSAORadius * 2.0) ? 1.0 : 0.0;
        
        // Calculate SSAO (Has to pass range-check, normal-check, and depth-check)
        occlusion += (rangeCheck * normalCheck * depthCheck) * uSSAOStrength * TEXCHECK;
    }
        
        
    // Invert SSAO
    occlusion = 1.0 - (occlusion / samplesOccluded);
    
    // Power
    float power = uSSAOPower;
    occlusion = pow( clamp( occlusion, 0.0, 1.0), power );
    
    // Send the final color
    gl_FragColor = vec4( occlusion, occlusion, occlusion, 1.0 );
    
}
