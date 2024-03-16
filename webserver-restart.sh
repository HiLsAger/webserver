#!/bin/bash

DOCKER_IMAGE_NAME="webserver-apache"
CONTAINER_NAME="ubuntu_apache_php"

echo "Запуск консоли контейнера " $CONTAINER_NAME
docker exec -it $CONTAINER_NAME bash -c "service apache2 restart && bash"

exit
