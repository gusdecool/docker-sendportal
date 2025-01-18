# SendPortal with Docker

## How to use the docker image
Run the docker image with the environment variables as specified in docker-compose.yml file. You will need to adjust 
the environment to follow your own server configuration.

Docker image public repository: https://hub.docker.com/r/gusdecool/send-portal

```shell
docker run gusdecool/send-portal:3.0.1
```

Then run the database migration to create the required tables.  
Finally, finalize the SendPortal setup by visiting: http://localhost:6101/setup

## How to build the docker image
clone the repo with specified tag
```shell
git clone --branch v3.0.1 --single-branch git@github.com:mettle/sendportal.git sendportal
```

build the image
```shell
docker-compose build app
```

## How to run the docker container.
The `docker-compose.yml` file is already configured with the required environment variables.
It's suitable if you want to run the container in a development environment.

```shell
docker-compose up -d
```

once the container is up, you will need to run the database migration. You only need to run this command once.
```shell
docker-compose exec app php artisan migrate
```

Finally, finalize the SendPortal setup by visiting: http://localhost:6101/setup
