var _enemy_damage = obj_battle_enemy.damage * random_range(0.8, 1.2);
obj_battle_player.hp -= _enemy_damage;

enemy_turn = 0;

if (check_for_end())
{
	alarm[2] = 60;
}