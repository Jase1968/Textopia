/// Add new line

var inputLine;
if(online) inputLine = name + ": " + keyboard_string;
else inputLine = keyboard_string

if(string_width(inputLine) > room_width - 32)
 inputLine = string_copy(inputLine, 0, string_length(inputLine) - 1) + "\n" +
 string_char_at(inputLine, string_length(inputLine));