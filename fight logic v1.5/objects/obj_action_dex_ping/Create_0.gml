action = function() {
    // Omega Scuffed Damage
    var local_damage = global.damage;
    local_damage += 0;

    // Pass the action function as an argument
    obj_battle_manager.player_dex_attack_ping(local_damage);
}

