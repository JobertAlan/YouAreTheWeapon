function verlet_part_list_constrain_in_bounds(argument0, argument1, argument2, argument3, argument4) {
	var part_list = argument0;
	var min_x = argument1;
	var min_y = argument2;
	var max_x = argument3;
	var max_y = argument4;
	var num = ds_list_size(part_list);
	for(var i=0; i<num; i++){
	    var part = part_list[|i];
	    verlet_part_constrain_in_bounds(part, min_x, min_y, max_x, max_y);
	}



}
