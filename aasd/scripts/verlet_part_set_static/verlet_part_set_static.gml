function verlet_part_set_static(argument0, argument1) {
	var p = argument0;
	var make_static = argument1;

	if(make_static){
	    verlet_part_set_mass(p, 0);
	} else {
	    verlet_part_set_mass(p, p.prev_mass);
	}



}
