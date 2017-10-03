var inputLine;
if(online) inputLine = name + ": " + keyboard_string;
else inputLine = keyboard_string

for(var h = 1; h <= hist[0]; h++){
 draw_text_color(0, room_height - 64 - (hist[0] - h) * 32, hist[h], col[h], col[h], col[h], col[h], 1);
}
draw_text(0, room_height - 32, inputLine);