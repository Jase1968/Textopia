/// Init Client

defineConstants();

socket = network_create_socket(network_socket_tcp);

ip = "127.0.0.1"; //local test
ip = "192.168.1.11"; //LAN
//ip = "192.168.1.11"; //LAN

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