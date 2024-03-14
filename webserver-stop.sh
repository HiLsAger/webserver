#!/bin/bash

DOCKER_IMAGE_NAME="webserver-apache"
CONTAINER_NAME="ubuntu_apache_php"
HOST_DIRECTORY="$(pwd)/www:/var/www/html"

# Проверяем, существует ли контейнер $CONTAINER_NAME
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Контейнер $CONTAINER_NAME существует, останавливаем его."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    echo "Вебсервер $CONTAINER_NAME был остановлен."
else
    echo "Контейнер $CONTAINER_NAME не был запущен."
fi
