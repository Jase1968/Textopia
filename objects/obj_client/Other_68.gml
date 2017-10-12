/// Networking

var rbuffer = ds_map_find_value(async_load, "buffer");

switch(buffer_read(rbuffer, buffer_u8)){
 case register:
  if(buffer_read(rbuffer, buffer_bool)){
   addLine("Register successful.", c_yellow);
   online = true;
   name = newName;
  }else{
   addLine("Username taken.", c_yellow);
   addLine("/New or /Continue", c_yellow);
   response = -1;
  }
  break;
  
 case login:
  if(buffer_read(rbuffer, buffer_bool)){
   addLine("Login successful.", c_yellow);
   online = true;
   name = loadName;
  }else{
   addLine("Username or password incorrect.", c_yellow);
   addLine("/New or /Continue", c_yellow);
   response = -1;
  }
  break;
  
 case chat:
  var message = buffer_read(rbuffer, buffer_string);
  var color = buffer_read(rbuffer, buffer_u32);
  addLine(message, color);
  break;
 
 case timeUpdate:
  time = buffer_read(rbuffer, buffer_u16);
  break;
 
 case colorChange:
  myColor = buffer_read(rbuffer, buffer_u32);
  break;
}