#!/bin/bash

DOCKER_IMAGE_NAME="webserver-apache"
BASH_ALIASES_FILE=~/.bash_aliases
RELOADED_FILE=~/.bashrc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Создание алиасов
echo 'Установка алиасов'
echo 'alias webserver-run="sh webserver-run.sh"' >> "$BASH_ALIASES_FILE"
echo 'alias webserver-stop="sh webserver-stop.sh"' >> "$BASH_ALIASES_FILE"
echo 'alias webserver-help="sh webserver-help.sh"' >> "$BASH_ALIASES_FILE"
echo 'alias webserver-restart="sh webserver-restart.sh"' >> "$BASH_ALIASES_FILE"
echo 'alias webserver-bash="sh webserver-bash.sh"' >> "$BASH_ALIASES_FILE"

# Перезапись алиасов
echo 'Перезапись алиасов'
source ~/.bashrc

# Сборка Docker контейнера
echo 'Сборка докер контейнера'
# Проверяем, существует ли сборка образа $DOCKER_IMAGE_NAME
if docker images "$DOCKER_IMAGE_NAME" | grep -q "$DOCKER_IMAGE_NAME"; then
    echo "Сборка образа $DOCKER_IMAGE_NAME уже существует."
else
    echo "Сборка образа $DOCKER_IMAGE_NAME не найдена. Начинаем сборку..."
    docker build -t $DOCKER_IMAGE_NAME .
fi

# Запуск контейнера с использованием алиаса
echo 'Введите webserver-help чтобы получить больше информации'