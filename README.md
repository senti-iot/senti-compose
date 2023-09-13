## Automatic Docker Compose

```sh
docker-compose -f docker-compose.yml -f docker-compose.git.yml -f docker-compose.dev.yml up --build
```

## Manual Docker
```sh
docker network create senti-network

docker build --pull --tag senti-iot/eventbroker .

docker run --rm --net senti-network -p 3024:3024 -v "$PWD/.env":/usr/src/app/.env senti-iot/eventbroker

docker build --pull --tag senti-iot/messagebroker .

docker run --rm --net senti-network -p 3024:3024 -v "$PWD/.env":/usr/src/app/.env senti-iot/messagebroker

docker run -d --net senti-network --env MARIADB_USER=senti --env MARIADB_PASSWORD=senti_secret --env MARIADB_ROOT_PASSWORD=root_secret --name mariadb mariadb
```
