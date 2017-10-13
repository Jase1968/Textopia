/// Init Client

defineConstants();

socket = network_create_socket(network_socket_tcp);

ip = "127.0.0.1"; //local test
ip = "192.168.1.11"; //LAN
<<<<<<< HEAD
ip = "75.134.43.51"; //Jason's Server IP
=======
//ip = "192.168.1.11"; //LAN
>>>>>>> bf822c4b2e65296829511b92c06433d7c14268ad

network_set_config(network_config_connect_timeout, 4000);

if(network_connect(socket, ip, 7000) < 0){
 show_message("Server is down. Try again later.");
 game_end();
}

hist[0] = 1;
hist[1] = "/New or /Continue";
col[1] = c_yellow;

name = "";
myColor = c_white;

online = false;
response = -1;

blinker = "_";
blinkSpeed = 15;
alarm[0] = blinkSpeed;

draw_set_font(font0);