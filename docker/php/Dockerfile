FROM php:7.3-apache

RUN apt-get update && apt-get install -y \
    git unzip libzip-dev zlib1g-dev mariadb-client \
    && docker-php-ext-install pdo pdo_mysql zip

# Apache vhost
COPY docker/php/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN mkdir -p /var/www/html/app/tmp/cache/{models,persistent,views} /var/www/html/app/tmp/logs &&  \
    chown -R www-data:www-data /var/www/html/app/tmp && \
    chmod -R 775 /var/www/html/app/tmp

WORKDIR /var/www/html

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Установка CakePHP 2
COPY composer.json /var/www/html/composer.json
RUN composer install --no-interaction --prefer-dist

# Папка приложения
RUN mkdir -p /var/www/html/app && chown -R www-data:www-data /var/www/html
