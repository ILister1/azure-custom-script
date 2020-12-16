#!/bin/bash

sudo apt update
sudo apt install git
curl https://get.docker.com | sudo bash

sudo apt install -y curl jq
# set which version to download (latest)
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
# download to /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# make the file executable
sudo chmod +x /usr/local/bin/docker-compose

git clone https://gitlab.com/qacdevops/chaperootodo_client.git
cd chaperootodo_client
sudo docker-compose up -d
