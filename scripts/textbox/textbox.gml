
switch(argument0){

case "textbox_text_selected_get":
/// @description textbox_text_selected_get(textbox)
/// @function textbox_text_selected_get
/// @param textbox
with(argument1)
{
    if(selectedStart == -1)
        return "";
    if(selectedStart > cursor)
    {
        return string_copy(text, cursor + 1, selectedStart - cursor);
    }
    else
    {
        return string_copy(text, selectedStart + 1, cursor - selectedStart);
    }
}

case "textbox_text_selected_remove":
/// @description textbox_text_selected_remove(textbox)
/// @function textbox_text_selected_remove
/// @param textbox
if(cursor < selectedStart)
    text = string_delete(text, cursor + 1, selectedStart - cursor);
else
{
    text = string_delete(text, selectedStart + 1, cursor - selectedStart);
    cursor = selectedStart;
}
if(cursor > string_length(text))
    cursor = string_length(text);
selectedStart = -1;
break;

case "textbox_text_selected_set":
/// @description textbox_text_selected_set(textbox, selectedStart, cursorPosition)
/// @function textbox_text_selected_set
/// @param textbox
/// @param  selectedStart
/// @param  cursorPosition
with(argument1)
{
    selectedStart = argument2;
    cursor = argument3;
}

case "textbox_text_insert":
/// @description textbox_text_insert(textbox, text)
/// @function textbox_text_insert
/// @param textbox
/// @param  text
/*
 * Inserts text in the textbox at the cursor position
*/
with(argument0)
{
    text = string_insert(argument1, text, cursor + 1);
    cursor += string_length(argument1);
    showCursor = true;
    alarm[0] = cursorBlinkTime;
}
break;

case "textbox_get_cursor_at":
/// @description textbox_get_cursor_at(textbox, xCoordinate)
/// @function textbox_get_cursor_at
/// @param textbox
/// @param  xCoordinate
var X = argument1 - argument0.x + offset;
with(argument0)
{
    for(var i = 1; i <= string_length(text); i ++)
    {
        if(string_width(string_hash_to_newline(string_copy(text, 1, i))) > X)
        {
            return i - 1;
        }
    }
    return string_length(text);
}

case "string_get_highest_index":
/// @description string_get_highest_index(string, find, highest)
/// @function string_get_highest_index
/// @param string
/// @param  find
/// @param  highest

for(var i = min(string_length(argument0), argument2); i >= 1; i --)
{
    if(string_char_at(argument0, i) == argument1)
    {
        if(i == 1)
            return i;
        else
        {
            if(string_char_at(argument0, i - 1) != argument1)
                return i;
        }
    }
}
return 0;

case "string_get_lowest_index":
/// @description string_get_lowest_index(string, find, lowest)
/// @function string_get_lowest_index
/// @param string
/// @param  find
/// @param  lowest

var m = string_length(argument0);
for(var i = argument2; i <= m; i ++)
{
    if(string_char_at(argument0, i) == argument1)
    {
        if(i == m)
            return i;
        else
        {
            if(string_char_at(argument0, i + 1) != argument1)
                return i;
        }
    }
}
return m;

}