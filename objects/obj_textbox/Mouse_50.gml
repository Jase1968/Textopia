if(selected && dragSelecting)
{
    if(selectedStart == -1)
        textbox("textbox_text_selected_set", id, cursor, textbox("textbox_get_cursor_at", id, mouse_x, false));
    else
        textbox("textbox_text_selected_set", id, selectedStart, textbox("textbox_get_cursor_at", id, mouse_x, false));
}

