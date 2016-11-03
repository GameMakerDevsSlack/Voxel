attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;

uniform sampler2D diffuse_buffer;
uniform sampler2D ssao_buffer;

void main() {
    // Get SSAO pixel
    vec4 ssao_sample = texture2D( ssao_buffer, v_vTexcoord );
    
    // Get Diffuse pixel
    vec4 diffuse_sample = texture2D( diffuse_buffer, v_vTexcoord );
    //diffuse_sample = vec4( 1.0 );
    
    // Combine diffuse and ssao
    gl_FragColor = diffuse_sample * ssao_sample;
}

