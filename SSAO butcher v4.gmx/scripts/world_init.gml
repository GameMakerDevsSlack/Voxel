///world_init()

global.voxel_palette = scr_voxel_build_rgb();
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_normal();
global.voxel_vft_simple = vertex_format_end();
global.vbf_pot = scr_voxel_load( "pot.vox", global.voxel_vft_simple );
vertex_freeze( global.vbf_pot );
