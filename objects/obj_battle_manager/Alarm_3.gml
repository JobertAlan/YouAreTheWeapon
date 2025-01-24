obj_battle_enemy.hp -= damage_to_enemy;
obj_battle_player.energy--;

if (!obj_battle_player.energy)
{
	enemy_turn = 1;
	obj_battle_player.energy = 5;
	alarm[0] = 60;
}