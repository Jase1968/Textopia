/// Networking

var rbuffer = ds_map_find_value(async_load, "buffer");

switch(buffer_read(rbuffer, buffer_u8)){
 case register:
  if(buffer_read(rbuffer, buffer_bool)){
   history += "\n" + "Register successful.";
   online = true;
   name = newName;
  }else{
   history += "\n" + "Username taken." + "\n" + "'New' or 'Continue'";
   response = -1;
  }
  break;
  
 case login:
  if(buffer_read(rbuffer, buffer_bool)){
   history += "\n" + "Login successful.";
   online = true;
   name = loadName;
  }else{
   history += "\n" + "Username or password incorrect." + "\n" + "'New' or 'Continue'";
   response = -1;
  }
  break;
  
 case chat:
  var message = buffer_read(rbuffer, buffer_string);
  //show_message_async(message);
  history += "\n" + message;
  break;
 
 case timeUpdate:
  time = buffer_read(rbuffer, buffer_u16);
  break;
}