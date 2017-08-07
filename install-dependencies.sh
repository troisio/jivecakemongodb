#!/bin/bash

yum -y update
yum install -y git-all nano man man-pages curl
yum clean all

#https://docs.docker.com/engine/installation/linux/centos/#install-with-the-script

curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker.service
sudo systemctl start docker

#https://docs.docker.com/compose/install/

curl -L "https://github.com/docker/compose/releases/download/1.15.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker pull mongo:3.4.6