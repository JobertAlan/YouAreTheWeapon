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

player_skill = function()
{
    damage_to_enemy = 3
    obj_battle_player.energy -= 3;
    alarm[0] = 60;
}

// Checks if the game should end based on player/enemy hp, will add something else later
check_for_end = function()
{
	return (obj_battle_enemy.hp <= 0 || obj_battle_player.hp <= 0)
}