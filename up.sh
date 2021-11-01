#! /bin/bash

#upgrade all
sudo apt update;
sudo apt full-upgrade -y;
sudo snap refresh;

# system
sudo apt installv net-tools neofetch git python3 python3-pip -y;

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;

# JS
sudo apt install nodejs npm -y;

# DOCKER 
sudo apt install docker docker-compose -y;