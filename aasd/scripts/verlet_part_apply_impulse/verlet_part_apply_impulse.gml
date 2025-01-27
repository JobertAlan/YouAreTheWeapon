function verlet_part_apply_impulse(argument0, argument1, argument2) {
	var p = argument0;
	var imp_x = argument1;
	var imp_y = argument2;
	p.prev_pos_x -= imp_x * p.inv_mass;
	p.prev_pos_y -= imp_y * p.inv_mass;



}
