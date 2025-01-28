/**
 * HP, damage, str, dex moved to internal object variable as to not get overwritten in each battle instance
 * */

hp = global.playerHp;
hp_total = hp;
damage = global.playerDmg;
shield = global.playerShield;

energy = global.playerEnergy;



//show_debug_message(string(dex));