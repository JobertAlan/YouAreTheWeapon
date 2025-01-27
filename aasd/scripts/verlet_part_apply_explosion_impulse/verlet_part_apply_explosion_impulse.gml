function verlet_part_apply_explosion_impulse(argument0, argument1, argument2, argument3, argument4) {
	var p = argument0;
	var explosion_x = argument1;
	var explosion_y = argument2;
	var radius = argument3;
	var intensity = argument4;

	var dx = p.x - explosion_x;
	var dy = p.y - explosion_y;
	var mag_sq = dx*dx+dy*dy;
	var min_dist = radius - p.radius;
	if(mag_sq > min_dist*min_dist){
	    exit;
	}
	var mag = sqrt(mag_sq);
	var f_len = (1-(mag/radius)) * intensity;
	var fx = (dx / mag) * f_len;
	var fy = (dy / mag) * f_len;
	verlet_part_apply_impulse(p, fx, fy); 





}
