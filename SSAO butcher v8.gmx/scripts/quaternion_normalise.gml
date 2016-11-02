///quaternion_normalise()

var _quaternion = argument0;

var _inv_dist = 1 / sqrt( sqr( _quaternion[0] ) +
                          sqr( _quaternion[1] ) +
                          sqr( _quaternion[2] ) +
                          sqr( _quaternion[3] ) );

var _arr;
_arr[0] = _quaternion[0] * _inv_dist;
_arr[1] = _quaternion[1] * _inv_dist;
_arr[2] = _quaternion[2] * _inv_dist;
_arr[3] = _quaternion[3] * _inv_dist;

return _arr;

