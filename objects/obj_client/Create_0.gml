/// Init Client

defineConstants();

socket = network_create_socket(network_socket_tcp);

ip = "127.0.0.1"; //local test

network_connect(socket, ip, 7000);

history = "'New' or 'Continue'";

name = "";

online = false;
response = -1;