FROM ubuntu:latest

# Не выводить интерактивные действия в консоль
ENV DEBIAN_FRONTEND=noninteractive

# Обновление и установка необходимых пакетов
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update

# Установка apache, php 7.4 и необходимых расширений
RUN apt-get install -y apache2 php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-curl php7.4-json php7.4-gd php7.4-mbstring php7.4-xml

RUN update-alternatives --set php /usr/bin/php7.4

RUN rm -rf /var/lib/apt/lists/*

# Копирование файлов конфигурации
COPY ./configs/apache/apache.conf /etc/phpmyadmin/apache.conf
COPY ./configs/apache/apache2.conf /etc/apache2/apache2.conf
COPY ./configs/apache/dir.conf /etc/apache2/mods-enabled/dir.conf
RUN ln -s /etc/apache2/mods-available/php7.4.conf /etc/apache2/mods-enabled/php7.4.conf
COPY ./www/ /var/www/html/
RUN chmod 644 /var/www/html/.htaccess
RUN a2enmod rewrite

# Установка порта для прослушивания
EXPOSE 80

# Запуск apache
CMD apache2ctl -D FOREGROUND
