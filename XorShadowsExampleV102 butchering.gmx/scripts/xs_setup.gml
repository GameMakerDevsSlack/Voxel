///xs_setup(resolution)

/*
    This function sets the essential variables for the shader.
    The shadow map resolution is always a square. That's why there's only one argument.
*/
globalvar XSdepth,XSmat,XSsoft,XSlinear,XScol,XSamb,XSambi,Udep,Umat,Usize,Ucol,Uamb;
XSdepth = surface_create(argument0,argument0);
XSmat[16] = 0;
XSsoft = 1;
XSlinear = 0;
XScol = $ffffff;
XSamb = $000000;
XSambi = 0.8;

Udep = shader_get_sampler_index(shdr_soft,"depthmap");
Umat = shader_get_uniform(shdr_soft,"lightmatrix");
Usize = shader_get_uniform(shdr_soft,"depthsize");
Ucol = shader_get_uniform(shdr_soft,"lightcol");
Uamb = shader_get_uniform(shdr_soft,"ambcol");

texture_set_interpolation_ext(Udep,0)
