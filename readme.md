# WebServer by HiLs

## Запуск веб сервера

### Установка докера

Установка и запуск докера.

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

```bash
apt-cache policy docker-ce
```

```bash
sudo apt install docker-ce
```

### Linux

Установка веб сервера из репозитория

```bash
git clone https://github.com/HiLsAger/webserver
```

Установка алиасов, сборка докерфайла и другие настройки системы

```bash
source webserver-install.sh
```

Запуск веб сервера

```bash
webserver-run
```

### Команды для взаимодействия

Запуск докер контейнера и вебсервера

```bash
webserver-run
```

Остановить докера контейнера

```bash
webserver-stop
```

Получить доступ к консоли внутри докер контейнера

```bash
webserver-bush
```

Перезапуск вебсервера внутри контейнера

```bash
webserver-restart
```

Получить больше информации по работе с вебсервером

```bash
webserver-help
```
