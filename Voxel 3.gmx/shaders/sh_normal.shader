attribute vec3 in_Position;
attribute vec3 in_Normal;

varying vec3 v_vNormal;

mat3 inverse(mat3 Original) {
    float determinant =       Original[0][0] * Original[1][1] * Original[2][2]
                            + Original[0][1] * Original[1][2] * Original[2][0]
                            + Original[0][2] * Original[1][0] * Original[2][1]
                            - Original[0][0] * Original[1][2] * Original[2][1]
                            - Original[0][1] * Original[1][0] * Original[2][2]
                            - Original[0][2] * Original[1][1] * Original[2][0];
                        
    float inverse_determinant = 1.0 / determinant;
    
    mat3 tmp;
    tmp[0][0] = Original[1][1] * Original[2][2] - Original[2][1] * Original[1][2];
    tmp[1][0] = Original[2][0] * Original[1][2] - Original[1][0] * Original[2][2];
    tmp[2][0] = Original[1][0] * Original[2][1] - Original[2][0] * Original[1][1];
    tmp[0][1] = Original[2][1] * Original[0][2] - Original[0][1] * Original[2][2];
    tmp[1][1] = Original[0][0] * Original[2][2] - Original[2][0] * Original[0][2];
    tmp[2][1] = Original[2][0] * Original[0][1] - Original[0][0] * Original[2][1];
    tmp[0][2] = Original[0][1] * Original[1][2] - Original[1][1] * Original[0][2];
    tmp[1][2] = Original[1][0] * Original[0][2] - Original[0][0] * Original[1][2];
    tmp[2][2] = Original[0][0] * Original[1][1] - Original[1][0] * Original[0][1];
    
    mat3 Result;
    Result[0][0] = inverse_determinant * tmp[0][0];
    Result[1][0] = inverse_determinant * tmp[1][0];
    Result[2][0] = inverse_determinant * tmp[2][0];
    Result[0][1] = inverse_determinant * tmp[0][1];
    Result[1][1] = inverse_determinant * tmp[1][1];
    Result[2][1] = inverse_determinant * tmp[2][1];
    Result[0][2] = inverse_determinant * tmp[0][2];
    Result[1][2] = inverse_determinant * tmp[1][2];
    Result[2][2] = inverse_determinant * tmp[2][2];
    
    return Result;
}

mat3 transpose(mat3 Original) {
    mat3 Result;
    Result[0][0] = Original[0][0];
    Result[0][1] = Original[1][0];
    Result[0][2] = Original[2][0];
    Result[1][0] = Original[0][1];
    Result[1][1] = Original[1][1];
    Result[1][2] = Original[2][1];
    Result[2][0] = Original[0][2];
    Result[2][1] = Original[1][2];
    Result[2][2] = Original[2][2];
    
    return Result;
}

mat3 getNormalMatrix() {
    mat3 M = mat3(gm_Matrices[MATRIX_WORLD_VIEW]);
    return transpose( inverse( M ) );
}

void main() {
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    mat3 normalMatrix = getNormalMatrix();
    v_vNormal = normalize((normalMatrix * in_Normal) * vec3( 1, 1, -1 ));
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec3 v_vNormal;

vec4 packNormal( vec3 Normal ){
    Normal = normalize( Normal );
    vec3 shifted = (Normal+vec3(1.0, 1.0, 1.0))/2.0;
    vec4 Colour = vec4( shifted, 1.0 );
    return Colour;
}


void main() {
    vec4 normColour = packNormal( normalize( v_vNormal ) );
    gl_FragColor = normColour;
}

