
set_player_action = function(_player_action)
{
    global.playerAction = _player_action;
    
    
    alarm[0] = 30;
}

// Enemy stats are altered by altering the global functions
// This resets them to default after ending a battle
reset_stats = function()
{
    global.playerEnergy = 5;
    global.playerShield = 0;
    
    global.enemyTurn = 0;
    
    global.bossHp = 10;
    global.bossDmg = 1;
    global.bossShield = 0;
    
    /** 
        0 = attack
    *  1 = shield
    
    **/
    global.enemyNextMove = 0;
}

check_game_end = function()
{
    if (global.bossHp <= 0)
    {
        global.lvlsWon++;
        reset_stats();
        room_goto(map_room);
        
    }
}

// Checks if X has shields, if so subtract from there before HP
shield_check = function()
{
    
}

global_basic_attack = function(_damage, _turn_order) // Player energy should be handled elsewhere
{
    if (!_turn_order)   // Damage the enemy
    {
        if (global.bossShield > 0) // Damage the shield first
        {
            global.bossShield -= _damage;
            
            if (global.bossShield < 0)
            {
                global.bossHp += global.enemyShield;
                global.bossShield = 0;
            }
        }
        else
            global.bossHp -= _damage;
    }
    else if (_turn_order) // Damage the player
    {
        if (global.playerShield > 0) // Damage the shield first
        {
            global.playerShield -= _damage;
                    
            if (global.playerShield < 0)
            {
                global.playerHp += global.playerShield;
                global.playerShield = 0;
            }
        }
        else
            global.playerHp -= _damage;
    }
    
    
    // Prevent values from going negative
    if (global.playerHp < 0)
    {
        global.playerHp = 0;
    }
    
    if (global.bossHp < 0)
    {
        global.bossHp = 0;
    }
}

global_add_shield = function(_turn_order)
{
    
    // ensure shields don't go over 10
    if (_turn_order && global.bossShield+3 <= 10)
    {
        global.bossShield += 3;
    }
    else if (_turn_order && global.bossShield >= 10)
    {
        global.bossShield = 10;
    }
    else if (!_turn_order && global.playerShield+3 <= 10)
    {
        global.playerShield += 3;
    }
    else if (!_turn_order && global.playerShield+3 >= 10)
    {
        global.playerShield = 10;
    }
}

global_add_health = function (_turn_order)
{
	global.bossCooldown.heal = max(0, global.bossCooldown.heal - 1);
	
if (global.bossHp < 15 && global.bossCooldown.heal == 0) {
	global.enemyNextMove = 3;
	global.bossCooldown.heal = 3;
}

global_heavy_atk = function (_turn_order)
{
global.bossCooldown.heavyAtk = max(0, global.bossCooldown.heavyAtk -1);

}



	
}
// Figure out what move enemy will do, either shields up or attack

enemy_next_move = function()
{
    enemy_move = irandom_range(0, 1);
    
    if (enemy_move)
        show_debug_message("Enemy does an attack");
    else if (!enemy_move) {
        show_debug_message("Enemy adds shields/heals");
    }
    
    return enemy_move;
}