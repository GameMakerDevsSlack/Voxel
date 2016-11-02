// SSAO VARIABLES
global.ssao_samples     = 16;   // Samples are "occluders". More Samples = more precise SSAO = slower
global.ssao_radius      = 4.0;  // Radius controls what distance the occluders are measured away from the sample point
global.ssao_strength    = 0.05;  // Strength multiplies the SSAO
global.ssao_power       = 22.0;  // Power contrasts the SSAO
global.ssao_resolution  = 1.0;  // Resolution controls well... the resolution of the SSAO. 1.0 = screen resolution. 2.0 = 2x screen res. 0.5 = 0.5x screen res.
global.ssao_blur_PASSES = 2;  // This is the amount of times the SSAO gets blurred.

global.ssao_enable    = true;   // Render the SSAO buffer ontop of the scene
global.DIFFUSE_ENABLE = true;   // Render the diffuse buffer (textures)


// Temp variable for projection matrix. Hand calculated, thanks for the built in matrix math gamemaker >:[
matrix_inverse_projection = -1;
matrix_proj               = -1;


// Disable application surface
application_surface_draw_enable( false );



// Create the sample kernal used for SSAO. There are 16 samples by default.
global.ssao_kernel = generateRandomPoissonDisk( global.ssao_samples );

// Generate the noise texture
global.ssao_noise  = surface_create( 4, 4 );
generateNoise( global.ssao_noise );


// Create FBOs used for SSAO shader (normal, depth, ssao)
generateFBO();