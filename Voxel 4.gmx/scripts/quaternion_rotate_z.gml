///quaternion_rotate_z( quaternion )

var _arr;
_arr[0] = dcos(argument1/2);
_arr[1] = 0;
_arr[2] = 0;
_arr[3] = dsin(argument1/2);

return quaternion_multiply( _arr, argument0 );

