FROM ubuntu:latest

# Не выводить интерактивные действия в консоль
ENV DEBIAN_FRONTEND=noninteractive

# Обновление и установка необходимых пакетов
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update

# Установка apache, php 7.4 и необходимых расширений
RUN mysql

RUN rm -rf /var/lib/apt/lists/*

# Копирование файлов конфигурации
COPY ./configs/apache/apache.conf /etc/phpmyadmin/apache.conf
COPY ./configs/apache/dir.conf /etc/apache2/mods-enabled/dir.conf
COPY ./www/ /var/www/html/

# Установка порта для прослушиванияsdfgsd
EXPOSE 80

# Запуск apache
CMD apache2ctl -D FOREGROUND
