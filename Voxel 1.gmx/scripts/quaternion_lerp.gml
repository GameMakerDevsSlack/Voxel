///quaternion_lerp( quaternion1, quaternion2, t )
//
//  Returns the spherical linear interpolation of two quaternions.
//
//      quaternion1    quaternion, 4-element array
//      quaternion2    quaternion, 4-element array
//      t              paramter, float, 0 <= t <= 1
//
//  Made by @jujuadams.
//
/// GMLscripts.com/license

var _a = argument0;
var _b = argument1;
var _t = argument2;

var _mag_a = sqrt( sqr( _a[0] ) + sqr( _a[1] ) + sqr( _a[2] ) + sqr( _a[3] ) );
var _mag_b = sqrt( sqr( _b[0] ) + sqr( _b[1] ) + sqr( _b[2] ) + sqr( _b[3] ) );

var _angle = arccos( ( _a[0]*_b[0] + _a[1]*_b[1] + _a[2]*_b[2] + _a[3]*_b[3] ) / ( _mag_a * _mag_b ) );

var _s0 = sin( _angle );
var _s1 = sin( ( 1 - _t ) * _angle ) / _s0;
var _s2 = sin( _t * _angle ) / _s0;

var _result;
_result[0] = _s1*_a[0] + _s2*_b[0];
_result[1] = _s1*_a[1] + _s2*_b[1];
_result[2] = _s1*_a[2] + _s2*_b[2];
_result[3] = _s1*_a[3] + _s2*_b[3];

return _result;
