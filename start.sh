#!/bin/sh
eval "DOCKER_API_VERSION=1.22 DOCKER_HOST=tcp://resin.local:2375 docker-compose up"
echo "okay it's running"