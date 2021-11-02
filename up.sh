#! /bin/bash

#upgrade all
sudo apt update;
sudo apt full-upgrade -y;
sudo snap refresh;

# system
sudo apt install neofetch git htop \
net-tools tlp \
python3 python3-pip \
cockpit cockpit-bridge cockpit-storaged cockpit-networkmanager \
-y;

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;

# JS
sudo apt install nodejs npm -y;

    # DOCKER 
sudo apt install docker docker-compose -y;

neofetch;