/// Init Client

defineConstants();

socket = network_create_socket(network_socket_tcp);

ip = "127.0.0.1"; //local test

network_connect(socket, ip, 7000);

hist[0] = 1;
hist[1] = "'New' or 'Continue'";
col[1] = c_yellow;

name = "";
myColor = c_white;

online = false;
response = -1;