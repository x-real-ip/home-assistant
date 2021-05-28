#!/bin/bash
set -e

# VARIABLES
container_name="prd-home-assistant-app"

# PULL DOCKER IMAGE FROM PRIVATE DOCKER REGISTRY
docker pull docker-registry.theautomation.nl/coen/${DRONE_REPO_NAME}

# STOP DOCKER CONTAINER
docker stop ${container_name}

# REMOVE DOCKER CONTAINER
docker rm ${container_name}

# RUN DOCKER CONTAINER
docker run -d \
-v /home/coen/docker-home-services/prd-home-assistant/config:/config \
-v /etc/localtime:/etc/localtime:ro \
--net=host \
--name ${container_name} \
--restart=always \
--env PGID=1000 \
--env PUID=1000 \
--env TZ=Europe/Amsterdam \
docker-registry.theautomation.nl/coen/${DRONE_REPO_NAME}:latest