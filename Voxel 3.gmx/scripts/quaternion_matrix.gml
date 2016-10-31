///quaternion_matrix( quaternion )

var _quaternion = argument0;

var _r = _quaternion[0];
var _x = _quaternion[1];
var _y = _quaternion[2];
var _z = _quaternion[3];

var _length = sqrt( sqr( _x ) + sqr( _y ) + sqr( _z ) );
var _hyp_sqr = sqr( _length ) + sqr( _r );

//calculate trig coefficients
var _c = 2 * sqr( _r ) / _hyp_sqr - 1;
var _s = 2 * _length * _r * _hyp_sqr;
var _omc = 1 - _c;

// normalise the input vector
_x /= _length;
_y /= _length;
_z /= _length;

//build matrix
var _arr;

_arr[ 0] = _omc * _x*_x + _c;
_arr[ 1] = _omc * _x*_y + _s*_z;
_arr[ 2] = _omc * _x*_z - _s*_y;
_arr[ 3] = 0;

_arr[ 4] = _omc * _x*_y - _s*_z;
_arr[ 5] = _omc * _y*_y + _c;
_arr[ 6] = _omc * _y*_z + _s*_x;
_arr[ 7] = 0;

_arr[ 8] = _omc * _x*_z + _s*_y;
_arr[ 9] = _omc * _y*_z - _s*_x;
_arr[10] = _omc * _z*_z + _c;
_arr[11] = 0;

_arr[12] = 0;
_arr[13] = 0;
_arr[14] = 0;
_arr[15] = 1;

return _arr;
