#!/bin/bash

TIMESTAMP=$(date -u +%Y-%m-%d-%H-%M-%S)
NAME=$(docker ps -aq --filter="name=jivecakemongo")

if [ -n "$NAME" ]
then
  docker exec jivecakemongo mongodump --archive=/data/mongo-$TIMESTAMP.archive
  docker cp jivecakemongo:/data/mongo-$TIMESTAMP.archive ~/mongo-$TIMESTAMP.archive
  docker exec jivecakemongo rm /data/mongo-$TIMESTAMP.archive
  ~/s3cmd-2.0.1/s3cmd put ~/mongo-$TIMESTAMP.archive s3://jivecakebackup -c ~/jivecake-s3.settings
  rm -f ~/mongo-$TIMESTAMP.archive
fi