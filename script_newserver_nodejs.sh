#!/bin/bash

apt update && apt upgrade -y

apt install build-essential

#instalar apache
apt-get install apache2 -y

#instalar dependências da api em NODE

#baixar script de instalação da versão desejada do node
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

#executar script baixado
chmod +x nodesource_setup.sh

sh nodesource_setup.sh

#instalar NODE.JS
apt-get install -y nodejs

#instalar adonis com npm
npm i -g @adonisjs/cli

#instalar pm2
npm install -g pm2

#baixar mysql 8 .deb
wget -c https://repo.mysql.com//mysql-apt-config_0.8.16-1_all.deb

#instalar mysql 8
dpkg -i mysql-apt-config_0.8.16-1_all.deb

apt update -y

#instalar mysql 8 community server
apt install mysql-community-server -y

rm -rf mysql-apt-config_0.8.16-1_all.deb

#fim