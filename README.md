# Описание

Тестовое задание на CakePhp

## Запуск
1. Скачать репозиторий `git clone git@github.com:Vogusov/cake_utm.git`.
2. Зайти в проект `cd cake_utm`.
3. Создать файл настройки БД `cp app/Config/database.php.default app/Config/database.php`. Вписать туда нужные значения. Взять из docker-compose.yml.
4. Запустить `docker compose up -d --build`. Подождать пока все создастся.
5. Зайти в контейнер `docker compose exec -it web bash` и запустить `composer install`.
6. В контейнере выполнить
 `mkdir -p app/tmp/cache/{models,persistent,views} app/tmp/logs`
 `chown -R www-data:www-data app/tmp`
 `chmod -R 775 app/tmp`
7. Создать БД из дампа. Вне контейнера выполнить `docker compose exec -T db mysqldump -u root -p utmdb > db_dump.sql`.
8. В браузере зайти на http://localhost:8070/statistics/utm/list
