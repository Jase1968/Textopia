/// Pressed Enter

var buffer = buffer_create(1024, buffer_grow, 1);
if(online){
 buffer_write(buffer, buffer_u8, chat);
 buffer_write(buffer, buffer_string, keyboard_string);
 network_send_packet(socket, buffer, buffer_tell(buffer));
}else{
 history += "\n" + keyboard_string;
 switch(response){
  case -1:
   if(compSentence(keyboard_string, "new") > .8){
    history += "\n" + "Create username:";
    response = createUsername;
   }else if(compSentence(keyboard_string, "continue") > .8){
    history += "\n" + "Enter username:";
	response = loadUsername;
   }
   break;
   
  case createUsername:
   newName = keyboard_string;
   history += "\n" + "Create password:";
   response = createPassword;
   break;
   
  case loadUsername:
   loadName = keyboard_string;
   history += "\n" + "Enter password:";
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
keyboard_string = "";