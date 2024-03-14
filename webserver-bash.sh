DOCKER_IMAGE_NAME="webserver-apache"
CONTAINER_NAME="ubuntu_apache_php"

echo "Запуск консоли контейнера " $CONTAINER_NAME
echo "Введите exit чтобы выйти"
docker exec -it $CONTAINER_NAME bash