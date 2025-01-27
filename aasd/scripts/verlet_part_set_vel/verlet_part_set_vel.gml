function verlet_part_set_vel(argument0, argument1, argument2) {
	var p = argument0;
	var vx = argument1;
	var vy = argument2;

	p.prev_pos_x = p.x - vx;
	p.prev_pos_y = p.y - vy;



}
