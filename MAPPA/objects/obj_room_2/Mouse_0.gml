if (!clear_condition)
{
    if (!global.lvlsWon < 1) {
        if (destination_room != noone) {
                room_goto(destination_room)
            
                show_debug_message("Enter room 2 Player Hp: " + string(global.playerHp));
            
                clear_condition = 1;
            }
    }
}