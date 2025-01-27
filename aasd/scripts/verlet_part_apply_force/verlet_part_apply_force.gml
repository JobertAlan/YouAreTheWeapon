function verlet_part_apply_force(argument0, argument1, argument2) {
	var p = argument0;
	p.forces_x += argument1;
	p.forces_y += argument2;
}