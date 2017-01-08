## JiveCake MongoDB

##### restart.sh

`stop` and `rm` the container named `jivecakemongo` and start a new container with port mapping `127.0.0.1:27017:27017` of the same name.
The first argument, if present, will be used as an mongoDB archive file used to populate the database.

#### Example

```sh
bash restart.sh
```

```sh
bash restart.sh path_to/mongo.archive
```

##### backup.sh

Extracts a mongoDB archive from the container named `jivecakemongo` and writes it to the `~/backup` directory at the argument machine . Machine user is `root`.

#### Example

```sh
bash backup.sh database.project.com
```