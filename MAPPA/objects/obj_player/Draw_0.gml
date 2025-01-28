// Draw player HP and Energy Bar

draw_self();

var _x = xstart + 3;
var _y = ystart + 5;
var _w = 40;
var _h = 10;

// For Hp
draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (hp / hp_total), _h, c_green, 1);


// For Energy
_w = 10
_y += _h;
_h = 6;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * energy, _h, c_aqua, 1);