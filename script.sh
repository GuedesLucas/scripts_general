#!/bin/bash

cd ~/Downloads

echo "INSTALANDO SPOTIFY"
sudo apt update && sudo apt upgrade -y
sudo apt install curl libcanberra-gtk-module software-properties-common apt-transport-https gnupg2 ubuntu-keyring -y
wget -O- https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/spotify.gpg
echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y

echo "INSTALANDO TEAMS"
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.5.00.10453_amd64.deb
sudo dpkg -i teams_1.5.00.10453_amd64.deb
sudo apt --fix-broken install

echo "INSTALANDO VSCODE"
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common apt-transport-https wget -y
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code

echo "INSTALANDO ANDROID STUDIO"
sudo apt update
sudo apt install openjdk-11-jdk -y
java --version
echo -ne '\n' | sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install android-studio -y

echo "INSTALANDO DISCORD"
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install ./discord.deb -y
sudo dpkg -i discord.deb

echo "INSTALANDO DOCKER"
sudo apt -y update
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
sudo apt remove docker docker-engine docker.io containerd runc
echo -ne '\n' | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
echo -ne '\n' | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
docker version

echo "INSTALANDO NODEJS"
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs

echo "LIMPANDO .DEB"
rm -rf *.deb

echo "LIMPANDO .tar"
rm -rf *.tar.*

echo "FINALIZANDO SCRIPT"
