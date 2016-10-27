///quaternion_random()

var _phi   =  pi * random_range( -0.5, 0.5 );
var _theta = 0.5 * arcsin( random_range( -1, 1 ) );
var _psi   =  pi * random_range( -0.5, 0.5 );

var _a, _b, _c;

_a[0] = cos( _phi );
_a[1] = sin( _phi );
_a[2] = 0;
_a[3] = 0;

_b[0] = cos( _theta );
_b[1] = 0;
_b[2] = sin( _theta );
_b[3] = 0;

_c[0] = cos( _psi );
_c[1] = 0;
_c[2] = 0;
_c[3] = sin( _psi );

return quaternion_multiply( quaternion_multiply( _a, _b ), _c );
