#!/bin/bash

DOCKER_IMAGE_NAME="webserver-apache"
BASH_ALIASES_FILE=~/.bash_aliases

DIR_PATH=$(pwd)

export PATH="/usr/bin:/bin:$DIR_PATH"

GREEN="\033[32m"
YALLOW="\033[33m"
GRAY="\033[37m"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Создание алиасов
echo 'Установка алиасов'
echo "alias webserver-start=\"bash $DIR_PATH/webserver-start.sh\"" >> "$BASH_ALIASES_FILE"
echo "alias webserver-stop=\"bash $DIR_PATH/webserver-stop.sh\"" >> "$BASH_ALIASES_FILE"
echo "alias webserver-help=\"bash $DIR_PATH/webserver-help.sh\"" >> "$BASH_ALIASES_FILE"
echo "alias webserver-restart=\"bash $DIR_PATH/webserver-restart.sh\"" >> "$BASH_ALIASES_FILE"
echo "alias webserver-bash=\"bash $DIR_PATH/webserver-bash.sh\"" >> "$BASH_ALIASES_FILE"
echo "alias webserver-rebuild=\"bash $DIR_PATH/webserver-rebuild.sh\"" >> "$BASH_ALIASES_FILE"

# Перезапись алиасов
echo 'Перезапись алиасов'
source ~/.bashrc

WWW_DIR="$DIR_PATH/www"

# Проверяем существует ли директория www
if [ ! -d "$WWW_DIR" ]; then
    mkdir -p "$WWW_DIR"
    echo "Hello world!!!" > "$WWW_DIR/index.html"
    echo "Файл index.html был $WWW_DIR создана."
fi

# Сборка Docker контейнера
echo 'Сборка докер контейнера'
# Проверяем, существует ли сборка образа $DOCKER_IMAGE_NAME
if docker images "$DOCKER_IMAGE_NAME" | grep -q "$DOCKER_IMAGE_NAME"; then
    echo "Сборка образа $DOCKER_IMAGE_NAME уже существует."
    bash $DIR_PATH/webserver-rebuild.sh
else
    echo "Сборка образа $DOCKER_IMAGE_NAME не найдена. Начинаем сборку..."
    docker build -t $DOCKER_IMAGE_NAME .
fi

# Запуск контейнера с использованием алиаса
echo "Введите webserver-help чтобы получить больше информации"