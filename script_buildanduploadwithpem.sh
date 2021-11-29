#!/bin/bash

echo "Entre com as informações de usuário do Servidor"
read user

echo "Entre com as informações de IP do Servidor"
read ip

echo "Entre com o caminho da pasta destino no Servidor"
read path

echo "Entre o caminho do Pem"
read pem


rm -rf node_modules
#rm -rf package-lock.json

npm install && ng build --prod

tar -czvf dist.tar.gz dist/


scp -i $pem dist.tar.gz $user@$ip:$path