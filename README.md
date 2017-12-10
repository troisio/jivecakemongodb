## JiveCake MongoDB

#### Start

```sh
docker run \
  -dit \
  -v /data/db/:/data/db \
  --name jivecakemongo \
  -p private-db@machine.com:27017:27017 \
  mongo:3.4.6
```

### Install machine dependencies
```sh
bash install.sh user@machine
```

#### Load archive into container

```sh
docker cp mongo.archive jivecakemongo:/root/backup.archive
docker exec -it jivecakemongo mongorestore --archive=/root/backup.archive
docker exec -it jivecakemongo rm /root/backup.archive
```

#### Retrieve archive from container

```sh
TIMESTAMP=$(date -u +%Y-%m-%d-%H-%M-%S)
docker exec -it jivecakemongo mongodump --archive=/data/mongo-$TIMESTAMP.archive
docker cp jivecakemongo:/data/mongo-$TIMESTAMP.archive ~/mongo-$TIMESTAMP.archive
docker exec -it jivecakemongo rm /data/mongo-$TIMESTAMP.archive
```