FROM ubuntu:latest

# Не выводить интерактивные действия в консоль
ENV DEBIAN_FRONTEND=noninteractive

# Установка apache, php
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php 
RUN apt-get install -y libapache2-mod-php
RUN rm -rf /var/lib/apt/lists/*

# Копирование файлов конфигурации
COPY ./configs/apache/apache.conf /etc/phpmyadmin/apache.conf
COPY ./configs/apache/dir.conf /etc/apache2/mods-enabled/dir.conf
COPY ./www/ /var/www/html/

# Установка порта для прослушивания
EXPOSE 80

# Запуск apache
CMD apache2ctl -D FOREGROUND
