#!/bin/bash

# install docker machine
DOCKER_INSTALL_PATH=/usr/local/bin
echo installing docker-machine...
curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_darwin-amd64 > $DOCKER_INSTALL_PATH/docker-machine
chmod +x $DOCKER_INSTALL_PATH/docker-machine

# install docker compose
echo installing docker-compose
curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > $DOCKER_INSTALL_PATH/docker-compose
chmod +x $DOCKER_INSTALL_PATH/docker-compose

# install docker command
echo installing docker
curl -L https://get.docker.com/builds/Darwin/x86_64/docker-latest > $DOCKER_INSTALL_PATH/docker

docker-machine create --driver virtualbox takasing
eval $(docker-machine env takasing)
