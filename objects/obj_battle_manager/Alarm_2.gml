// Dummy logic for enemy to just hit the player back

// Use obj_battle_enemy.damage directly
var damage_taken = obj_battle_enemy.damage; // Use the enemy's damage value

// Apply damage to the player
if (obj_battle_player.shield > 0) {
    if (obj_battle_player.shield >= damage_taken) {
        // Shield absorbs all damage
        obj_battle_player.shield -= damage_taken;
        damage_taken = 0;
    } else {
        // Shield absorbs part of the damage
        damage_taken -= obj_battle_player.shield;
        obj_battle_player.shield = 0;
    }
}

// Apply remaining damage to HP
obj_battle_player.hp -= damage_taken;

// Ensure HP doesn't go below 0
if (obj_battle_player.hp < 0) {
    obj_battle_player.hp = 0;
}

enemy_turn = 0; // Ends enemy turn and then checks everyone's HP to see if the game should end or not

// If not, repeat loop
if (check_for_end())
{
    alarm[2] = 60;
}