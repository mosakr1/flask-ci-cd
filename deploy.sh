#!/bin/bash

CONTAINER_NAME="flask_app_container"

DOCKER_USERNAME="mosakr1"

IMAGE_NAME="flask-devops:latest"

echo "Stopping and removing old container if it exists..."
docker rm -f $CONTAINER_NAME || true

echo "Pulling latest image from Docker Hub..."
docker pull $DOCKER_USERNAME/$IMAGE_NAME

echo "Running new container..."
docker run -d --name $CONTAINER_NAME -p 5005:5005 $DOCKER_USERNAME/$IMAGE_NAME

echo "Deployment complete!"
docker ps | grep $CONTAINER_NAME
