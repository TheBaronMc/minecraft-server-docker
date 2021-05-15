# Minecraft-Server-Docker

This is project aims to create an image of spigot.

## Build image

First of all, you need to **clone this repository**. Than, **move in it**. Depending on the version of Minecraft you want, you need to change value of the environment variable `MINCRAFT_VERSION`. Finally, run the docker build command :

``` bash
docker build . --tag minecraft-server:version
```

**Be aware of available version of Minecraft supported by Spigot : https://hub.spigotmc.org/versions/**

Pre-built images are available [here](https://hub.docker.com/r/baronmc/minecraft-server).

## Run image

### Docker CLI

``` bash
docker run -it baronmc/minecraft-server:1.16.5
```

### Docker-compose

In this repository, a `docker-compose.yml` is available. To run it, you have to create a `.env` file who contains the value of `MINCRAFT_VERSION` and `SERVER_DIR`. 

