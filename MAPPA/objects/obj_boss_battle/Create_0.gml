set_player_action = function(_player_action)
{
    global.playerAction = _player_action;
    
    
    alarm[0] = 30;
}


reset_stats = function()
{
    global.playerEnergy = 5;
    global.playerShield = 0;
    
    global.enemyTurn = 0;
    
    global.bossHp = 45;
    global.bossDmg = 5;
    global.bossShield = 0;
	global.bossCooldown = {
	heavyAtk: 0,
	heal: 0,
	debuff: 0
};
    
   
    global.enemyNextMove = 0;
}
check_game_end = function()
{
    if (global.enemyHp <= 0)
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
    if (_turn_order && global.enemyShield+3 <= 10)
    {
        global.enemyShield += 3;
    }
    else if (_turn_order && global.enemyShield >= 10)
    {
        global.enemyShield = 10;
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

//boss patterns
function boss_move() {
global.bossCooldown.heavyAtk = max(0, global.bossCooldown.heavyAtk -1);
global.bossCooldown.heal = max(0, global.bossCooldown.heal - 1);
global.bossCooldown.debuff = max(0, global.Cooldown.debuff -1);
}

//prio heal if low hp
if (global.bossHp < 15 && global.bossCooldown.heal == 0) {
	global.enemyNextMove = 3;
	global.bossCooldown.heal = 3;
}