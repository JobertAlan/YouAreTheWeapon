function verlet_part_get_life_norm(argument0) {
	var p = argument0;
	if(p.ini_life <= 0){
	    return 0;
	} 
	return p.life / p.ini_life;



}
