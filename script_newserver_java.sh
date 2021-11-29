#!/bin/bash

apt update && apt upgrade -y

#instalar apache
apt-get install apache2 -y

#mover apache maven e jdk 8 para a pasta opt para a instalação
mv apache-maven-3.6.3.tar.xz /opt
mv jvm.tar.xz /opt

#ir para a pasta /opt
cd /opt

#descompactar arquivos
tar -xvf apache-maven-3.6.3.tar.xz
tar -xvf jvm.tar.xz

#remover arquivos compactados em tar
rm -f apache-maven-3.6.3.tar.xz
rm -f jvm.tar.xz

#instalar maven
cd /usr/bin 
ln -s /opt/apache-maven-3.6.3/bin/mvn mvn

#instalar jdk 8 com update-alternatives
cd
update-alternatives --install /usr/bin/java java /opt/jvm/jdk1.8.0_261/bin/java 0
update-alternatives --install /usr/bin/javac javac /opt/jvm/jdk1.8.0_261/bin/javac 0

#baixar mysql 8 .deb
wget -c https://repo.mysql.com//mysql-apt-config_0.8.16-1_all.deb

#instalar mysql 8
dpkg -i mysql-apt-config_0.8.16-1_all.deb

apt update -y

#instalar mysql 8 community server
apt install mysql-community-server -y

rm -rf mysql-apt-config_0.8.16-1_all.deb

#fim