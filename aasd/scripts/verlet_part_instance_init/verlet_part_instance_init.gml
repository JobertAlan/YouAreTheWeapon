///init verlet variables with default values
///verlet vars
function verlet_part_instance_init() {
	prev_pos_x = x;
	prev_pos_y = y;
	forces_x = 0;
	forces_y = 0;

	//drag should be a value between 0 and 1 and will be resistance to movement (0 = will not move, 1 = no resistance)
	drag = 0.98; 

	//use script verlet_part_set_mass(m) to set the mass, dont set directly
	mass = 1;
	inv_mass = 1;
	prev_mass = mass;

	life = 0;
	ini_life = 0;

	//default radius
	radius = 10;

	//private
	micros_to_seconds = 1/1000000;



}
