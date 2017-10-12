/// Resize

if(room_width != round(window_get_width()) ||
   room_height != round(window_get_height())){
 room_set_width(room0, round(window_get_width()));
 room_set_height(room0, round(window_get_height()));
 room_set_width(room1, round(window_get_width()));
 room_set_height(room1, round(window_get_height()));
 if(room == room0) room_goto(1);
 else room_goto(0);
}