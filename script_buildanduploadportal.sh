#!/bin/bash

echo "Entre com as informações de usuário do Servidor"
read user

echo "Entre com as informações de IP do Servidor"
read ip

echo "Entre com o caminho da pasta destino no Servidor"
read path


rm -rf node_modules

npm install && ng build --prod

tar -czvf dist.tar.gz dist/


scp dist.tar.gz $user@$ip:$path