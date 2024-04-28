DOCKER_IMAGE_NAME="webserver-apache"
DIR_PATH=$(pwd)

echo "Остановка webserver"
bash $DIR_PATH/webserver-stop.sh

echo "Сборка нового контейнера docker"
docker build --rm -t $DOCKER_IMAGE_NAME .