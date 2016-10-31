///camera_set_projection()

x = 0;
y = 0;
direction = 315;
zdir      = -25;
z         = 100;
aspect    = view_wview[0]/view_hview[0];
zfar      = 2000;

var _x_to = x + dsin( direction + 90 ) * dcos( zdir );
var _y_to = y + dcos( direction + 90 ) * dcos( zdir );
var _z_to = z + dsin( zdir );
d3d_set_projection_ext(     x,     y,     z,
                        _x_to, _y_to, _z_to,
                            0,     0,     1,
                        45, aspect, 0.01, zfar );

/*
// Initialise temp variables
var xfrom, yfrom, zfrom;
var xto, yto, zto;


// Set cameras position
xfrom = obj_camera.xs;
yfrom = obj_camera.ys;
zfrom = obj_camera.zs;

// Set cameras "look" vectors
xto = xfrom + obj_camera.camera_look_x * cos( degtorad( obj_camera.pitch ) );
yto = yfrom + obj_camera.camera_look_y * cos( degtorad( obj_camera.pitch ) );
zto = zfrom + obj_camera.camera_look_z;

d3d_set_projection_ext( xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1, obj_camera.cameraFov, view_wview[0]/view_hview[0], obj_camera.cameraNear, obj_camera.cameraFar);
*/
