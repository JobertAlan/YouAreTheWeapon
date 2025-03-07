draw_self();

var _x = xstart + 3;
var _y = ystart + 5;
var _w = 40;
var _h = 10;

// For Hp
draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (global.enemyHp / hp_total), _h, c_green, 1);


// For Shield
_y += _h + 4;
_h = 6;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (global.enemyShield / 10), _h, c_orange, 1);