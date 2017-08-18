var inputLine;
if(online) inputLine = name + ": " + keyboard_string;
else inputLine = keyboard_string

draw_text(0, room_height - 64 - string_height(history), history);

draw_text(0, room_height - 64, inputLine);