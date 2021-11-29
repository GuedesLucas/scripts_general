#!/bin/bash

echo "Enter your username"

read username

apt update

apt install docker.io

systemctl enable --now docker

groupadd docker

usermod -aG docker $username

docker run hello-world