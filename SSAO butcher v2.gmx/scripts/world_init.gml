//for( var i=0; i < 15; i++ ){
var i = 8;
    global.mapmodels[i] = d3d_model_create();
    d3d_model_load( global.mapmodels[i], string(i)+".d3d" );

global.voxel_palette = scr_voxel_build_rgb();
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_normal();
global.voxel_vft_simple = vertex_format_end();
global.vbf_pot = scr_voxel_load( "pot.vox", global.voxel_vft_simple );
vertex_freeze( global.vbf_pot );
