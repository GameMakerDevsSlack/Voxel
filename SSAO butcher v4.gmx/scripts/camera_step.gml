// Mouselook
if ( mouse_check_button( mb_right ) ) {
    if (!mouseLock) {
        mouse_x_lock = window_mouse_get_x();
        mouse_y_lock = window_mouse_get_y();
    }
    
    mouseLock = true;
    if (mouseLock) {
        // Calculate mouse change
        var dx = window_mouse_get_x() - mouse_x_lock;
        var dy = window_mouse_get_y() - mouse_y_lock;
        window_mouse_set(mouse_x_lock, mouse_y_lock);
        
        // Affect pitch/yaw
        pitch -= dy / 10.0;
        yaw   -= dx / 10.0;
        pitch = min(max(-89.9, pitch), 89.9);
        
        // Calculate look vectors
        camera_look_x = cos( degtorad( -yaw ) );
        camera_look_y = sin( degtorad( -yaw ) );
        camera_look_z = sin( degtorad( pitch ) );
    }
} else {
    mouseLock = false;
}

ticks++;

// Movement
var cam_speed = 0.8;
var camera_look_x_pitch = camera_look_x * cos( degtorad( pitch ) );
var camera_look_y_pitch = camera_look_y * cos( degtorad( pitch ) );
if( keyboard_check( ord("W" ))){ x += camera_look_x_pitch * cam_speed; y += camera_look_y_pitch * cam_speed; z += camera_look_z * cam_speed }
if( keyboard_check( ord("S" ))){ x -= camera_look_x_pitch * cam_speed; y -= camera_look_y_pitch * cam_speed; z -= camera_look_z * cam_speed }
if( keyboard_check( ord("A" ))){ x += camera_look_y * cam_speed; y -= camera_look_x * cam_speed; }
if( keyboard_check( ord("D" ))){ x -= camera_look_y * cam_speed; y += camera_look_x * cam_speed; }
if( keyboard_check( ord("Q" ))) {  z += cam_speed;     }
if( keyboard_check( ord("E" ))) {  z -= cam_speed;     }

obj_camera.xs += (obj_camera.x - obj_camera.xs)*0.075;
obj_camera.ys += (obj_camera.y - obj_camera.ys)*0.075;
obj_camera.zs += (obj_camera.z - obj_camera.zs)*0.075;
