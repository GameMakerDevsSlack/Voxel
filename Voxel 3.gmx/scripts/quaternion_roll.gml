///quaternion_roll( quaternion )

var _arr;
_arr[0] = dcos(argument1/2);
_arr[1] = dsin(argument1/2);
_arr[2] = 0;
_arr[3] = 0;

return quaternion_multiply( argument0, _arr );

