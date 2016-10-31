///draw_scene(demo)

/*
    This is my example draw code.
    This is not part of the engine.
*/
d3d_draw_block(0,0,-room_height,room_width,room_height,0,background_get_texture(bac_metal),8,8)
if argument0
{
    texture_set_repeat(1)
    d3d_transform_add_rotation_z(current_time/100)
    d3d_transform_add_translation(192,64,32)
    d3d_model_draw(model_teapot,0,0,0,background_get_texture(bac_blank))
    d3d_transform_set_identity()
    d3d_model_draw(model_torus_knot,64,192,32,background_get_texture(bac_blank))
    d3d_transform_add_rotation_z(-current_time/120)
    d3d_transform_add_translation(64,64,32)
    d3d_model_draw(model_bunny,0,0,0,background_get_texture(bac_blank))
    d3d_transform_set_identity()
}
else
{    
    with(obj_ellipsoid)
    {
        d3d_draw_ellipsoid(x-r,y-r,z-r,x+r,y+r,z+r,background_get_texture(bac_wood),1,1,32)
    }
    d3d_set_culling(0)
    with(obj_block)
    {
        image_angle += a;
        d3d_transform_add_rotation_z(image_angle)
        d3d_transform_add_translation(x,y,z)
        d3d_draw_block(-r,-r,-r,r,r,r,background_get_texture(bac_rock),1,1)
        d3d_draw_block(-r*0.4,-r*0.4,-r*0.4,r*0.4,r*0.4,r*0.4,background_get_texture(bac_metal),1,1)
        d3d_transform_set_identity()
    }
    d3d_set_culling(1)
    
    d3d_model_draw( model_torus_knot, 96, 128, 32, background_get_texture( bac_blank ) );
    
    with(obj_plant)
    {
        d3d_transform_add_rotation_y(180)
        d3d_transform_add_rotation_z(image_angle)
        d3d_transform_add_translation(x,y,r*2)
        d3d_draw_wall(r,0,0,-r,0,r*2,background_get_texture(bac_plant),1,1)
        d3d_draw_wall(-r,0,0,r,0,r*2,background_get_texture(bac_plant),1,1)
        d3d_draw_wall(0,r,0,0,-r,r*2,background_get_texture(bac_plant),1,1)
        d3d_draw_wall(0,-r,0,0,r,r*2,background_get_texture(bac_plant),1,1)
        d3d_transform_set_identity()
    }
}
