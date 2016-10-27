///xs_set_shadows()

/*
    This script applies the shadows to anything you draw until you use xs_reset_shadows().
*/
if XSsoft
{
    if XSlinear
    {
        shader_set(shdr_linear)
    }
    else
    {
        shader_set(shdr_soft)
    }
}
else
{
    shader_set(shdr_point)
}
shader_set_uniform_matrix_array(Umat,XSmat)
texture_set_stage(Udep,surface_get_texture(XSdepth))
shader_set_uniform_f(Usize,surface_get_width(XSdepth))
shader_set_uniform_f(Ucol,colour_get_red(XScol)/255,colour_get_green(XScol)/255,colour_get_blue(XScol)/255)
shader_set_uniform_f(Uamb,colour_get_red(XSamb)/255,colour_get_green(XSamb)/255,colour_get_blue(XSamb)/255,XSambi)
