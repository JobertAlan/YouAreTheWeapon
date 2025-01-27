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

player_skill = function(additional_shield)
{
     if (obj_battle_player.energy >= 3) { // Check if the player has enough energy
        obj_battle_player.shield += 5; // Increase shield by 5
       obj_battle_player.energy -= 3; // Reduce energy by 3
        alarm[0] = 60; // Set a cooldown (if needed)
    }

   
    alarm[0] = 60;
}

// Checks if the game should end based on player/enemy hp, will add something else later
check_for_end = function()
{
	return (obj_battle_enemy.hp <= 0 || obj_battle_player.hp <= 0)
}