var inputLine;
if(online) inputLine = name + ">" + keyboard_string;
else inputLine = ">" + keyboard_string;
var addSpace = string_length(inputLine) % round(room_width / string_width(" ")) == 0 ? " " : "";

var histHeight = 0;
for(var h = 1; h <= hist[0]; h++){
 histHeight += 4 + string_height_ext(hist[h], 16, room_width);
 draw_text_ext_color(0, room_height - string_height_ext(inputLine + "_", 16, room_width) - histHeight, hist[h], 16, room_width, col[h], col[h], col[h], col[h], 1);
}

var drawColor = myColor;
var rgb = split(string_replace_all(string_replace_all(keyboard_string, " ", ""), "/", ""), ",");
if(rgb[0] == 3 && string_count(rgb[1] + rgb[2] + rgb[3], string_digits(keyboard_string))){
 var red = real(string_digits(rgb[1]));
 var green = real(string_digits(rgb[2]));
 var blue = real(string_digits(rgb[3]));
 if(red >= 0 && red < 256 &&
    green >= 0 && green < 256 &&
	blue >= 0 && blue < 256)
 var drawColor = make_color_rgb(red, green, blue);
}
draw_text_ext_color(0, room_height - string_height_ext(inputLine + "_", 16, room_width), inputLine + addSpace + blinker, 16, room_width, drawColor, drawColor, drawColor, drawColor, 1);