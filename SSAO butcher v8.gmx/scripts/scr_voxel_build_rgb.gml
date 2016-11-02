///scr_voxel_build_rgb()

/*
var _arr = array_create(
$00000000, $ffffffff, $ffccffff, $ff99ffff, $ff66ffff, $ff33ffff, $ff00ffff, $ffffccff, $ffccccff, $ff99ccff, $ff66ccff, $ff33ccff, $ff00ccff, $ffff99ff, $ffcc99ff, $ff9999ff,
$ff6699ff, $ff3399ff, $ff0099ff, $ffff66ff, $ffcc66ff, $ff9966ff, $ff6666ff, $ff3366ff, $ff0066ff, $ffff33ff, $ffcc33ff, $ff9933ff, $ff6633ff, $ff3333ff, $ff0033ff, $ffff00ff,
$ffcc00ff, $ff9900ff, $ff6600ff, $ff3300ff, $ff0000ff, $ffffffcc, $ffccffcc, $ff99ffcc, $ff66ffcc, $ff33ffcc, $ff00ffcc, $ffffcccc, $ffcccccc, $ff99cccc, $ff66cccc, $ff33cccc,
$ff00cccc, $ffff99cc, $ffcc99cc, $ff9999cc, $ff6699cc, $ff3399cc, $ff0099cc, $ffff66cc, $ffcc66cc, $ff9966cc, $ff6666cc, $ff3366cc, $ff0066cc, $ffff33cc, $ffcc33cc, $ff9933cc,
$ff6633cc, $ff3333cc, $ff0033cc, $ffff00cc, $ffcc00cc, $ff9900cc, $ff6600cc, $ff3300cc, $ff0000cc, $ffffff99, $ffccff99, $ff99ff99, $ff66ff99, $ff33ff99, $ff00ff99, $ffffcc99,
$ffcccc99, $ff99cc99, $ff66cc99, $ff33cc99, $ff00cc99, $ffff9999, $ffcc9999, $ff999999, $ff669999, $ff339999, $ff009999, $ffff6699, $ffcc6699, $ff996699, $ff666699, $ff336699,
$ff006699, $ffff3399, $ffcc3399, $ff993399, $ff663399, $ff333399, $ff003399, $ffff0099, $ffcc0099, $ff990099, $ff660099, $ff330099, $ff000099, $ffffff66, $ffccff66, $ff99ff66,
$ff66ff66, $ff33ff66, $ff00ff66, $ffffcc66, $ffcccc66, $ff99cc66, $ff66cc66, $ff33cc66, $ff00cc66, $ffff9966, $ffcc9966, $ff999966, $ff669966, $ff339966, $ff009966, $ffff6666,
$ffcc6666, $ff996666, $ff666666, $ff336666, $ff006666, $ffff3366, $ffcc3366, $ff993366, $ff663366, $ff333366, $ff003366, $ffff0066, $ffcc0066, $ff990066, $ff660066, $ff330066,
$ff000066, $ffffff33, $ffccff33, $ff99ff33, $ff66ff33, $ff33ff33, $ff00ff33, $ffffcc33, $ffcccc33, $ff99cc33, $ff66cc33, $ff33cc33, $ff00cc33, $ffff9933, $ffcc9933, $ff999933,
$ff669933, $ff339933, $ff009933, $ffff6633, $ffcc6633, $ff996633, $ff666633, $ff336633, $ff006633, $ffff3333, $ffcc3333, $ff993333, $ff663333, $ff333333, $ff003333, $ffff0033,
$ffcc0033, $ff990033, $ff660033, $ff330033, $ff000033, $ffffff00, $ffccff00, $ff99ff00, $ff66ff00, $ff33ff00, $ff00ff00, $ffffcc00, $ffcccc00, $ff99cc00, $ff66cc00, $ff33cc00,
$ff00cc00, $ffff9900, $ffcc9900, $ff999900, $ff669900, $ff339900, $ff009900, $ffff6600, $ffcc6600, $ff996600, $ff666600, $ff336600, $ff006600, $ffff3300, $ffcc3300, $ff993300,
$ff663300, $ff333300, $ff003300, $ffff0000, $ffcc0000, $ff990000, $ff660000, $ff330000, $ff0000ee, $ff0000dd, $ff0000bb, $ff0000aa, $ff000088, $ff000077, $ff000055, $ff000044,
$ff000022, $ff000011, $ff00ee00, $ff00dd00, $ff00bb00, $ff00aa00, $ff008800, $ff007700, $ff005500, $ff004400, $ff002200, $ff001100, $ffee0000, $ffdd0000, $ffbb0000, $ffaa0000,
$ff880000, $ff770000, $ff550000, $ff440000, $ff220000, $ff110000, $ffeeeeee, $ffdddddd, $ffbbbbbb, $ffaaaaaa, $ff888888, $ff777777, $ff555555, $ff444444, $ff222222, $ff111111 );
*/

var _arr = array_create(
         0, 4294967295, 4291624959, 4288282623, 4284940287, 4281597951, 4278255615, 4294954239, 4291611903, 4288269567, 4284927231, 4281584895, 4278242559, 4294941183, 4291598847,
4288256511, 4284914175, 4281571839, 4278229503, 4294928127, 4291585791, 4288243455, 4284901119, 4281558783, 4278216447, 4294915071, 4291572735, 4288230399, 4284888063, 4281545727,
4278203391, 4294902015, 4291559679, 4288217343, 4284875007, 4281532671, 4278190335, 4294967244, 4291624908, 4288282572, 4284940236, 4281597900, 4278255564, 4294954188, 4291611852,
4288269516, 4284927180, 4281584844, 4278242508, 4294941132, 4291598796, 4288256460, 4284914124, 4281571788, 4278229452, 4294928076, 4291585740, 4288243404, 4284901068, 4281558732,
4278216396, 4294915020, 4291572684, 4288230348, 4284888012, 4281545676, 4278203340, 4294901964, 4291559628, 4288217292, 4284874956, 4281532620, 4278190284, 4294967193, 4291624857,
4288282521, 4284940185,4281597849,4278255513,4294954137,4291611801,4288269465,4284927129,4281584793,4278242457,4294941081,4291598745,4288256409,4284914073,4281571737,
4278229401, 4294928025,4291585689,4288243353,4284901017,4281558681,4278216345,4294914969,4291572633,4288230297,4284887961,4281545625,4278203289,4294901913,4291559577,
4288217241, 4284874905,4281532569,4278190233,4294967142,4291624806,4288282470,4284940134,4281597798,4278255462,4294954086,4291611750,4288269414,4284927078,4281584742,
4278242406, 4294941030,4291598694,4288256358,4284914022,4281571686,4278229350,4294927974,4291585638,4288243302,4284900966,4281558630,4278216294,4294914918,4291572582,
4288230246, 4284887910,4281545574,4278203238,4294901862,4291559526,4288217190,4284874854,4281532518,4278190182,4294967091,4291624755,4288282419,4284940083,4281597747,
4278255411,4294954035,4291611699,4288269363,4284927027,4281584691,4278242355,4294940979,4291598643,4288256307,4284913971,4281571635,4278229299,4294927923,4291585587,
4288243251,4284900915,4281558579,4278216243,4294914867,4291572531,4288230195,4284887859,4281545523,4278203187,4294901811,4291559475,4288217139,4284874803,4281532467,
4278190131,4294967040,4291624704,4288282368,4284940032,4281597696,4278255360,4294953984,4291611648,4288269312,4284926976,4281584640,4278242304,4294940928,4291598592,
4288256256,4284913920,4281571584,4278229248,4294927872,4291585536,4288243200,4284900864,4281558528,4278216192,4294914816,4291572480,4288230144,4284887808,4281545472,
4278203136,4294901760,4291559424,4288217088,4284874752,4281532416,4278190318,4278190301,4278190267,4278190250,4278190216,4278190199,4278190165,4278190148,4278190114,
4278190097,4278251008,4278246656,4278237952,4278233600,4278224896,4278220544,4278211840,4278207488,4278198784,4278194432,4293787648,4292673536,4290445312,4289331200,
4287102976,4285988864,4283760640,4282646528,4280418304,4279304192,4293848814,4292730333,4290493371,4289374890,4287137928,4286019447,4283782485,4282664004,4280427042,4279308561 );

return _arr;
