attribute vec3 in_Position;
attribute vec4 in_Colour;

varying vec4 v_vColour;

void main() {
    
    vec4 object_space_pos = vec4(in_Position,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec4 v_vColour;

void main() {
    gl_FragColor = v_vColour;
}
