#!/bin/bash
#Descompacta a pasta do portal compilado
tar -xzvf dist.tar.gz

#Muda permissão dos arquivos
chown -R root:root dist/

#Entra na pasta dist
cd dist/
echo "Dentro da pasta Dist"

#Copia os arquivos para html
cp -R *.* /var/www/html/
echo "Files gerais Movidos"
cp -R assets/ /var/www/html/
echo "Assets movidos"

cd ../
rm -rf dist dist.tar.gz
echo "Remove arquivos antigos limpando a pasta"

echo "Fim"
#fim do script