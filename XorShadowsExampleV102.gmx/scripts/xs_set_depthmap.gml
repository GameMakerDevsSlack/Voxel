///xs_set_depthmap(xfrom,yfrom,zfrom,xto,yto,zto)

/*
    This sets up the projection variables for use by the shader.
    Simply put the light's x,y and z and the position the light is facing.
    Anything you draw until you use xs_reset_depthmap() will be added to the depthmap.
*/
var lx,ly,lx,lx2,ly2,lz2;
lx = argument0;
ly = argument1;
lz = argument2;
lx2 = argument3;
ly2 = argument4;
lz2 = argument5;
surface_set_target(XSdepth)
draw_clear(-1)
d3d_set_projection_ext(lx,ly,lz,lx2,ly2,lz2,0,0,1,30,1,1,65536)
XSmat = matrix_multiply(matrix_get(matrix_view), matrix_get(matrix_projection));

shader_set(shdr_depth)
