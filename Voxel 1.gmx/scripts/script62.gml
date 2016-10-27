///slerp_3d( vector1, vector2, t )
//
//  Returns the spherical linear interpolation of two 3D vectors.
//
//      vector1    3D vector, 3-element array
//      vector2    3D vector, 3-element array
//      t          paramter, float, 0 <= t <= 1
//
//  Made by @jujuadams.
//
/// GMLscripts.com/license

var _a = argument0;
var _b = argument1;
var _t = argument2;

var _angle = arccos( dot_product_3d_normalised( _a[0], _a[1], _a[2],   _b[0], _b[1], _b[2] ) );

var _s0 = sin( _angle );

var _result;
if ( abs( _s0 ) < 0.001 ) {
    
    _result[0] = 0.5*_a[0] + 0.5*_b[0];
    _result[1] = 0.5*_a[1] + 0.5*_b[1];
    _result[2] = 0.5*_a[2] + 0.5*_b[2];
    
} else {
    
    var _s1 = sin( ( 1 - _t ) * _angle ) / _s0;
    var _s2 = sin( _t * _angle ) / _s0;
    
    _result[0] = _s1*_a[0] + _s2*_b[0];
    _result[1] = _s1*_a[1] + _s2*_b[1];
    _result[2] = _s1*_a[2] + _s2*_b[2];

}

return _result;
