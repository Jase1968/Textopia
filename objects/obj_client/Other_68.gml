/// Networking

var rbuffer = ds_map_find_value(async_load, "buffer");

switch(buffer_read(rbuffer, buffer_u8)){
 case register:
  if(buffer_read(rbuffer, buffer_bool)){
   hist[0]++;
   hist[hist[0]] = "Register successful.";
   col[hist[0]] = c_yellow;
   online = true;
   name = newName;
  }else{
   hist[0]++;
   hist[hist[0]] = "Username taken.";
   col[hist[0]] = c_yellow;
   hist[0]++;
   hist[hist[0]] = "'New' or 'Continue'";
   col[hist[0]] = c_yellow;
   response = -1;
  }
  break;
  
 case login:
  if(buffer_read(rbuffer, buffer_bool)){
   hist[0]++;
   hist[hist[0]] = "Login successful.";
   col[hist[0]] = c_yellow;
   online = true;
   name = loadName;
  }else{
   hist[0]++;
   hist[hist[0]] = "Username or password incorrect." + "\n" + "'New' or 'Continue'";
   col[hist[0]] = c_yellow;
   response = -1;
  }
  break;
  
 case chat:
  var message = buffer_read(rbuffer, buffer_string);
  //show_message_async(message);
  hist[0]++;
  hist[hist[0]] = message;
  col[hist[0]] = c_red;
  break;
 
 case timeUpdate:
  time = buffer_read(rbuffer, buffer_u16);
  break;
}