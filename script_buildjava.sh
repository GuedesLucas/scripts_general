#!/bin/bash

#Realziar clean do mvn
mvn clean

# Realizar o install com o Skip de Testes
mvn install -DskipTests

# Acessar a pasta Target
cd target/


# rodar o Screen
screen
