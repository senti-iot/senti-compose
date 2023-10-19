# Senti IoT platform compose

About [Senti: Open Source IoT Service Platform](https://senti.io/).

## Prerequisites

```sh
# Install Docker and Docker Compose: Example for Linux Debian / Ubuntu:
apt update && apt install docker-compose

# Fetch current code:
git clone https://github.com/senti-iot/senti-compose.git
cd ./senti-compose/senti-iot/
```

## Configuration

Create `./senti-compose/senti-iot/.env` with:

```env
TODO=1
```

Create `./senti-compose/senti-iot/eventbroker/.env` with:

```env
TODO=1
```

Copy example and edit `./senti-iot/mosquitto/config/.passwd`:

```sh
cp ./mosquitto/config/example.passwd ./mosquitto/config/.passwd
```

## Automatic Docker Compose

```sh
docker-compose pull

# Note: use `-f docker-compose.dev.yml` only for development
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
