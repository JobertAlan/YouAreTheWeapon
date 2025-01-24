enemy_turn = 0;
damage_to_enemy = 0;

player_attack = function(_damage)
{
	damage_to_enemy = _damage;
	alarm[3] = 60;
}

check_for_end = function()
{
	return (obj_battle_enemy.hp <= 0 || obj_battle_player.hp <= 0)
}