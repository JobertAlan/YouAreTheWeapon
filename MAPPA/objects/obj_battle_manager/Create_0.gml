
set_player_action = function(_player_action)
{
    global.playerAction = _player_action;
    
    
    alarm[0] = 30;
}


// When battle is over, for now just assuming player wins, no logic to check if player dies
// gain 1 level
// Reset stats of enemy for programmmatically assigned HP & whatever else you want
// Reset shields of player back to 0
// Returns player to map room
check_game_end = function()
{
    if (global.enemyHp <= 0)
    {
        global.lvlsWon++;
        reset_stats();
        room_goto(map_room);
        
    }
}

// Enemy stats are altered by altering the global functions
// This resets them to default after ending a battle
reset_stats = function()
{
    global.playerEnergy = 5;
    global.playerShield = 0;
    
    global.enemyTurn = 0;
    
    global.enemyHp = 10;
    global.enemyDmg = 1;
    global.enemyShield = 0;
    global.enemyShieldModifier = 0;   // Future planned use where maybe higher lvl enemy can cast like 4-5 shield instead of only 3 but not used atm
    
    /** 
        0 = attack
    *  1 = shield
    
    **/
    global.enemyNextMove = 0;
}




global_basic_attack = function(_damage, _turn_order) // Player energy should be handled elsewhere
{
    if (!_turn_order)   // Damage the enemy
    {
        if (global.enemyShield > 0) // Damage the shield first
        {
            global.enemyShield -= _damage;
            
            if (global.enemyShield < 0)
            {
                global.enemyHp += global.enemyShield;
                global.enemyShield = 0;
            }
        }
        else
            global.enemyHp -= _damage;
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
    
    if (global.enemyHp < 0)
    {
        global.enemyHp = 0;
    }
}

global_add_shield = function(_turn_order)
{
    
    // ensure shields don't go over 10
    if (_turn_order && global.enemyShield+3 <= 10)          // Adds enemy shields
    {
        global.enemyShield += 3;
    }
    else if (_turn_order && global.enemyShield >= 10)
    {
        global.enemyShield = 10;
    }
    else if (!_turn_order && global.playerShield+3 <= 10)   // Adds player shields
    {
        global.playerShield += 3;
    }
    else if (!_turn_order && global.playerShield+3 >= 10)
    {
        global.playerShield = 10;
    }
}

// Figure out what move enemy will do, either shields up or attack

enemy_next_move = function()
{
    enemy_move = irandom_range(0, 1);
    
    if (enemy_move)
        show_debug_message("Enemy does an attack");
    else if (!enemy_move) {
        show_debug_message("Enemy adds shields");
    }
    
    return enemy_move;
}