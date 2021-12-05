#!/bin/bash

echo "Informe a URL do GIT"
read git

echo "Entre com a Branch"
read branch

#Git Clone
git clone -b $branch $git

#Limpa backup de API
rm -rf api-old

#Cria Backup de API
mv api api-old

#Remove API Atual
rm -rf api

#Cria um novo
mv $git api

#Atualiza o APP.JS em ambiente de Prod
cp -r srv-js_env-bkp/server.js /home/ubuntu/back/api/src/

#Atualiza o .ENV para o de Prod
cp -r srv-js_env-bkp/.env /home/ubuntu/back/api


#Acessar pasta
cd api/src

#Atualizar pacotes do NodeJS
npm install

#Gera Build
npm run build

#Processo de remoção do PM2 e Start do Servidor
pm2 delete 0
pm2 start npm --name "$branch" -- start start-prod
#cd /home/ubuntu/api/
#clear
#npm run dev