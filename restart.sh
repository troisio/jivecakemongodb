#!/bin/bash

ids=$(docker ps --filter="name=jivecakemongo" -qa)

if [ "$ids" != "" ]; then
    docker stop "$ids"
    docker rm "$ids"
fi

docker run -it -d --name jivecakemongo -p 127.0.0.1:27017:27017 mongo:3.4.1

if [ -a "$1" ] && [ ! -d "$1" ]; then
  docker cp $1 jivecakemongo:/root/backup.archive
  docker exec -it jivecakemongo mongorestore --archive=/root/backup.archive
  docker exec -it jivecakemongo rm /root/backup.archive
fi