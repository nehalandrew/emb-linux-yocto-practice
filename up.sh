#! /bin/bash

#upgrade all
sudo apt update;
sudo apt full-upgrade -y;
sudo snap refresh;

# system
sudo apt install neofetch git htop \
net-tools tlp \
python3 python3-pip \
cockpit* \
-y;

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;

# WEB
sudo apt install nginx mariadb-server

# JS
sudo apt install nodejs npm -y;

# DOCKER 
sudo apt install docker docker-compose -y;



neofetch;