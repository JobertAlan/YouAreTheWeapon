// Battle state variables
enemy_turn = 0;
damage_to_enemy = 0;

// Player functions i.e: attacks, skills, use items, whatever
player_attack = function(_damage)
{
	damage_to_enemy = _damage;
    obj_battle_player.energy -= 1;
	alarm[0] = 60;
}

player_dex_attack_ping = function(_damage)
{
    damage_to_enemy = _damage;
	
    // 75% chance to skip energy consumption
    if (random(1) < 0.75) {
        show_debug_message("Attack succeeded without consuming energy!" +string(obj_battle_player.Eviscerate_Count));
		obj_battle_player.Eviscerate_Count++
		
      
    } else {
        show_debug_message("Attack succeeded and energy was consumed." +string(obj_battle_player.Eviscerate_Count));
        obj_battle_player.energy -= 1;
        obj_battle_player.Eviscerate_Count++
    }
	 
    alarm[0] = 1;
}



player_dex_attack_eviscerate = function(_damage){
	
	damage_to_enemy =  3 * obj_battle_player.Eviscerate_Count;
	 obj_battle_player.energy -= 2;
	alarm[0] = 60;
}

player_skill = function(additional_shield)
{
     if (obj_battle_player.energy >= 3) { // Check if the player has enough energy
        obj_battle_player.shield += 5; // Increase shield by 5
       obj_battle_player.energy -= 3; // Reduce energy by 3
        alarm[0] = 60; // Set a cooldown (if needed)
    }

   
    alarm[0] = 60;
}

player_str_attack_smash = function(_damage){
	damage_to_enemy = 30;
	obj_battle_player.hp -=5;
	obj_battle_player.energy -=4;
}

player_str_attack_feast = function(_damage){
	damage_to_enemy = 10;
	obj_battle_player.hp +=2;
	obj_battle_player.energy -=2;
}

// Checks if the game should end based on player/enemy hp, will add something else later
check_for_end = function()
{
	return (obj_battle_enemy.hp <= 0 || obj_battle_player.hp <= 0)
}