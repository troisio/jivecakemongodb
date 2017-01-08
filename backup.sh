#!/bin/bash

TIMESTAMP=$(date -u +%Y-%m-%d-%H-%M-%S)

docker exec -it jivecakemongo mongodump --archive=/data/jivecakemongodb-$TIMESTAMP.archive
docker cp jivecakemongo:/data/jivecakemongodb-$TIMESTAMP.archive ~/jivecakemongodb-$TIMESTAMP.archive
docker exec -it jivecakemongo rm /data/jivecakemongodb-$TIMESTAMP.archive

ssh root@$1 mkdir -p ~/backup
scp ~/backup/jivecakemongodb-$TIMESTAMP.archive root@$1:~/backup/jivecakemongodb-$TIMESTAMP.archive

rm ~/jivecakemongodb-$TIMESTAMP.archive