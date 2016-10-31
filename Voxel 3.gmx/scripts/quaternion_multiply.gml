///quaternion_multiply( quaternion 1, quaternion 2 )

var _a = argument0;
var _b = argument1;

var _arr;
_arr[0] = _a[0]*_b[0] - _a[1]*_b[1] - _a[2]*_b[2] - _a[3]*_b[3];
_arr[1] = _a[0]*_b[1] + _a[1]*_b[0] + _a[2]*_b[3] - _a[3]*_b[2];
_arr[2] = _a[0]*_b[2] + _a[2]*_b[0] + _a[3]*_b[1] - _a[1]*_b[3];
_arr[3] = _a[0]*_b[3] + _a[3]*_b[0] + _a[1]*_b[2] - _a[2]*_b[1];

return _arr;
