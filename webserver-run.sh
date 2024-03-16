#!/bin/bash

DOCKER_IMAGE_NAME="webserver-apache"
CONTAINER_NAME="ubuntu_apache_php"
HOST_DIRECTORY="$(pwd)/www:/var/www/html"

echo "Введите порт, на который нужно вешать контейнер:"
read PORT

# Проверяем, существует ли сборка образа $DOCKER_IMAGE_NAME
if docker images "$DOCKER_IMAGE_NAME" | grep -q "$DOCKER_IMAGE_NAME"; then
    echo "Сборка образа $DOCKER_IMAGE_NAME существует."
else
    echo "Сборка образа $DOCKER_IMAGE_NAME не найдена. запустите установку webserver при помощи sh webserver-install.sh"
fi

# Проверяем, существует ли контейнер $CONTAINER_NAME
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Контейнер $CONTAINER_NAME существует, останавливаем его."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
else
    echo "Контейнер $CONTAINER_NAME не существует."
fi

# Запуск контейнера с новым образом
echo "Запускаем контейнер $CONTAINER_NAME с образом $DOCKER_IMAGE_NAME..."
docker run -d -p $PORT:80 --name $CONTAINER_NAME -v $HOST_DIRECTORY $DOCKER_IMAGE_NAME
