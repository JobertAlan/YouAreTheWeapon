if (!clear_condition)
{
    if (destination_room != noone) {
        room_goto(destination_room)
        
        clear_condition = 1;
    }
}