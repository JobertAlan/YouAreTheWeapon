/**
 * HP, damage, str, dex moved to internal object variable as to not get overwritten in each battle instance
 * */

hp = global.playerHp;
hp_total = global.totalPlayerHp;
damage = global.playerDmg;
shield = global.playerShield;
shield_total = shield;

energy = global.playerEnergy;
energy_total = energy;


//show_debug_message(string(dex));