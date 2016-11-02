attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TexCoords;

varying vec2 v_vTexcoords;
varying vec4 v_vColour;


void main() {
    vec4 object_space_pos = vec4(in_Position,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoords = in_TexCoords;
    v_vColour = in_Colour;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoords;
varying vec4 v_vColour;

void main() {
    vec4 textureSample = texture2D( gm_BaseTexture, v_vTexcoords );
    
    // Alpha test
    if (textureSample.a < 0.5)
        discard;
        
    // Set all alpha to 1.0
    textureSample.a = 1.0;
    
    // Draw to screen
    gl_FragColor = textureSample * v_vColour;
}
