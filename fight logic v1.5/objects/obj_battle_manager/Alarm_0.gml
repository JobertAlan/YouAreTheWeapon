
obj_battle_enemy.hp -= damage_to_enemy;

if (!obj_battle_player.energy)
{
    enemy_turn = 1;
    obj_battle_player.energy = 6;
    alarm[1] = 60;
	obj_battle_player.Eviscerate_Count = 0;
}


