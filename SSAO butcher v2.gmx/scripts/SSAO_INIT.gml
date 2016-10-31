// SSAO VARIABLES

global.SSAO_SAMPLES     = 16;   // Samples are "occluders". More Samples = more precise SSAO = slower
global.SSAO_RADIUS      = 0.85;  // Radius controls what distance the occluders are measured away from the sample point
global.SSAO_STRENGTH    = 0.10;  // Strength multiplies the SSAO
global.SSAO_POWER       = 1.5;  // Power contrasts the SSAO
global.SSAO_RESOLUTION  = 1.0;  // Resolution controls well... the resolution of the SSAO. 1.0 = screen resolution. 2.0 = 2x screen res. 0.5 = 0.5x screen res.
global.SSAO_BLUR_PASSES = 1;  // This is the amount of times the SSAO gets blurred.


global.SSAO_ENABLE    = true;   // Render the SSAO buffer ontop of the scene
global.DIFFUSE_ENABLE = true;   // Render the diffuse buffer (textures)


// Temp variable for projection matrix. Hand calculated, thanks for the built in matrix math gamemaker >:[
matrix_inverse_projection = -1;
matrix_proj               = -1;


// Disable application surface
application_surface_draw_enable( false );



// Create the sample kernal used for SSAO. There are 16 samples by default.
global.SSAO_KERNEL = generateRandomPoissonDisk( global.SSAO_SAMPLES );

// Generate the noise texture
global.SSAO_NOISE  = surface_create( 4, 4 );
generateNoise( global.SSAO_NOISE );


// Create FBOs used for SSAO shader (normal, depth, ssao)
generateFBO();
