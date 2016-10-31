attribute vec3 in_Position;

varying float linearizedDepth;

uniform float uCameraFar;
uniform float uCameraNear;

void main() {
    
    vec4 object_space_pos = vec4(in_Position,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    linearizedDepth = gl_Position.z / uCameraFar;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying float linearizedDepth;

vec3 packDepth( float f ) {
    return vec3( floor( f * 255.0 ) / 255.0, fract( f * 255.0 ), fract( f * 255.0 * 255.0 ) );
}

void main() {
    
    float depth = linearizedDepth;
    gl_FragColor = vec4( packDepth(depth), 1.0 );
    
}
