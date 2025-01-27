function verlet_part_constrain_in_bounds(argument0, argument1, argument2, argument3, argument4) {
	var p = argument0;
	var min_x = argument1;
	var min_y = argument2;
	var max_x = argument3;
	var max_y = argument4;

	min_x += p.radius;
	min_y += p.radius;
	max_x -= p.radius;
	max_y -= p.radius;

	if(p.x < min_x){
	    p.x = min_x;
	} else if(p.x > max_x){
	    p.x = max_x;
	}

	if(p.y < min_y){
	    p.y = min_y;
	} else if(p.y > max_y){
	    p.y = max_y;
	}



}
