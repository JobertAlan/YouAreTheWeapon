/// @description init part_list + parent event + set max parts
part_list = ds_list_create();
max_particles = global.nb_bubles_;

w=global.width__;
h=global.height__;

size_buble_ = global.size_buble_;
spr_= global.spr_map_;
side_vertical = global.vertical_;

if (side_vertical == true) {
	var temp_x = x;
	x = y;
	y = temp_x;
	//var temp_w = w;
	//w = h;
	//h = temp_w;
}

for (var i=0; i<max_particles;i++) {
	var _x = random_range(x, w);
	var _y = random_range(y, h);
	var p = instance_create_layer(_x, _y, "layer_particles", obj_particle);
	ds_list_add(part_list, p);
	var scale = size_buble_[irandom_range(0, array_length(size_buble_)-1)];
	p.image_xscale = scale;
	p.image_yscale = scale;
	p.radius = p.sprite_width * 0.5;

	var force_dir = random_range(0, pi*2);
	var ini_impulse = random_range(30, 60);
	var fx = sin(force_dir) * ini_impulse;
	var fy = cos(force_dir) * ini_impulse;
	verlet_part_apply_impulse(p, fx, fy);
}

alarm[0] = room_speed*2;