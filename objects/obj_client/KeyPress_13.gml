/// Pressed Enter

var buffer = buffer_create(1024, buffer_grow, 1);
if(online){
 buffer_write(buffer, buffer_u8, chat);
 buffer_write(buffer, buffer_string, keyboard_string);
 network_send_packet(socket, buffer, buffer_tell(buffer));
}else{
 addLine(keyboard_string, myColor);
 switch(response){
  case -1:
   if(compSentence(keyboard_string, "/new") > .8){
    addLine("Create username:", c_yellow);
    response = createUsername;
   }else if(compSentence(keyboard_string, "/continue") > .8){
	addLine("Enter username:", c_yellow);
	response = loadUsername;
   }
   break;
   
  case createUsername:
   newName = keyboard_string;
   addLine("Create password:", c_yellow);
   response = createPassword;
   break;
   
  case loadUsername:
   loadName = keyboard_string;
   addLine("Enter password:", c_yellow);
   response = loadPassword;
   break;
   
  case createPassword:
   buffer_write(buffer, buffer_u8, register);
   buffer_write(buffer, buffer_string, newName);
   buffer_write(buffer, buffer_string, keyboard_string);
   network_send_packet(socket, buffer, buffer_tell(buffer));
   response = -4;
   break;
   
  case loadPassword:
   buffer_write(buffer, buffer_u8, login);
   buffer_write(buffer, buffer_string, loadName);
   buffer_write(buffer, buffer_string, keyboard_string);
   network_send_packet(socket, buffer, buffer_tell(buffer));
   break;
 }
}

buffer_delete(buffer);
if(keyboard_string == "/exit")
 game_end();
else if(keyboard_string == "/logout")
 game_restart();
else if(keyboard_string == "/windowed" ||
		keyboard_string == "/window" ||
		keyboard_string == "/fullscreen"){
 if(window_get_fullscreen()){
  window_set_size(1024, 768);
 }
 window_set_fullscreen(!window_get_fullscreen());
}
keyboard_string = "";