FROM php:7.2-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql && adduser hassan && usermod -g www-data hassan
ENV PHP_EXTENSIONS 'mysqli pdo pdo_mysql'
ENV APACHE_DOCUMENT_ROOT /var/lib/mysql
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
