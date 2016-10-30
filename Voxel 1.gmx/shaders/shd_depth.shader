attribute vec3 in_Position;

varying float depth;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    depth = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos).z;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying float depth;

vec3 ftov(float f) {
    return vec3(floor(f/256.0)/256.0,fract(f/256.0),fract(floor(f*256.0)/256.0));
}
float vtof(vec3 v) {
    return (v.r*65536.0+v.g*256.0+v.b);
}

void main() {
    gl_FragColor = vec4(ftov(depth*16.0),1.0);
}
