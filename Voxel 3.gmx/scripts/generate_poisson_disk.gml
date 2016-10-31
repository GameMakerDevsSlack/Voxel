///generate_poisson_disk( samples )

var _samples = argument0;

var _array;

for( var _i = 0; _i < _samples; _i++ ){
    
    var _x, _y;
    var _x = random( 2.0 ) - 1.0;
    var _y = random( 2.0 ) - 1.0;
    
    var _mag = sqrt( _x*_x + _y*_y );
    
    // Normalize
    _x /= _mag;
    _y /= _mag;
    
    // exponentiate scale
    var _scale = _i / _samples;
    _scale = lerp( 0.1, 1.0, _scale*_scale );
    _x *= _scale;
    _y *= _scale;
    
    // set to value
    _array[ _i*2     ] = _x;
    _array[ _i*2 + 1 ] = _y;
}

return _array;
