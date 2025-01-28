damage_done = 0;

set_player_action = function(_player_action)
{
    global.playerAction = _player_action;
    
    global.playerEnergy--;
    
    alarm[0] = 30;
}

check_game_end = function()
{
    if (global.enemyHp <= 0)
    {
        global.lvlsWon++;
        room_goto_previous();
    }
}

global_basic_attack = function(_damage, _turn_order) // Player energy should be handled elsewhere
{
    _entity_hp = 0;
    
    if (_turn_order)        // Damage the player
    {
        _entity_hp = global.playerHp;
        _entity_hp -= _damage;
        global.playerHp = _entity_hp;
    }
    else if (!_turn_order)  // Damage the enemy
    {
        _entity_hp = global.enemyHp;
        _entity_hp -= _damage;
        global.enemyHp = _entity_hp;
        
        
    }
    
    if (_entity_hp < 0 && _turn_order) // Ensure hp doesn't go into negatives
    {
        _entity_hp = 0;
        global.playerHp = 0;
    }
    else if (_entity_hp < 0 && !_turn_order)
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