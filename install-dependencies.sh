#!/bin/bash

cd ~
yum -y update
yum install -y git-all nano man man-pages curl wget cronie python-dateutil
yum clean all

wget https://github.com/s3tools/s3cmd/releases/download/v2.0.1/s3cmd-2.0.1.tar.gz
tar -xvf s3cmd-2.0.1.tar.gz
rm -f s3cmd-2.0.1.tar.gz

#https://docs.docker.com/engine/installation/linux/centos/#install-with-the-script

curl -fsSL https://get.docker.com/ | sh
systemctl enable docker.service
systemctl start docker

systemctl enable crond.service
systemctl start crond.service

echo "0 3 * * * /bin/bash ~/backup.sh" | crontab

#https://docs.docker.com/compose/install/

curl -L "https://github.com/docker/compose/releases/download/1.17.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker pull mongo:3.4.6