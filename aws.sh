#!/bin/bash

sudo apt install -y curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce docker-compose -y
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart
sudo chmod -R 777 /var/run/docker.sock

git clone --recurse-submodules https://github.com/rafagan/reports-platform.git
docker-compose -f docker-compose-production.yml up

docker exec -it 86b3bc52764d  /bin/bash