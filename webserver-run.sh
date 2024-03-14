#!/bin/bash

DOCKER_IMAGE_NAME="webserver-apache"
CONTAINER_NAME="ubuntu_apache_php"
HOST_DIRECTORY="$(pwd)/www:/var/www/html"

echo "Введите порт, на который нужно вешать контейнер:"
read PORT

# Проверяем, существует ли сборка образа $DOCKER_IMAGE_NAME
if docker images "$DOCKER_IMAGE_NAME" | grep -q "$DOCKER_IMAGE_NAME"; then
    echo "Сборка образа $DOCKER_IMAGE_NAME уже существует."
else
    echo "Сборка образа $DOCKER_IMAGE_NAME не найдена. Начинаем сборку..."
    docker build -t $DOCKER_IMAGE_NAME .
fi

# Проверяем, запущен ли контейнер $CONTAINER_NAME
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Контейнер $CONTAINER_NAME запущен, останавливаем его."
    docker stop $CONTAINER_NAME
else
    echo "Контейнер $CONTAINER_NAME не запущен."
fi

# Запуск контейнера с новым образом
echo "Запускаем контейнер $CONTAINER_NAME с образом $DOCKER_IMAGE_NAME..."
docker run -d -p $PORT:80 --name $CONTAINER_NAME -v $HOST_DIRECTORY $DOCKER_IMAGE_NAME
