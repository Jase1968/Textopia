var inputLine;
if(online) inputLine = name + ": " + keyboard_string;
else inputLine = keyboard_string

for(var h = 1; h <= hist[0]; h++){
 draw_text_color(0, room_height - 48 - (hist[0] - h) * 16, hist[h], col[h], col[h], col[h], col[h], 1);
}
draw_text_color(0, room_height - 32, inputLine, myColor, myColor, myColor, myColor, 1);