if (!clear_condition)
{
    if (!global.lvlsWon < 1) {
        if (destination_room != noone) {
                room_goto(destination_room)
            }
    }
}