#! /bin/bash
#
# Filename : install_docker.sh
#
# Purpose  : Install docker.io & docker-compose on Ununtu machines
#
# History  :
# 2023-08-29 MEY craeted
# -----------------------------------------------------------------

apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update

apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

docker compose version
