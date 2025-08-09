FROM php:7.4-fpm-alpine

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install mysqli gd \
    && docker-php-ext-enable mysqli gd

# Set proper permissions for Apache to access files
RUN mkdir -p /var/www/html/uploads \
    && chown -R www-data:www-data /var/www/html/uploads \
    && chmod -R 775 /var/www/html/uploads

USER www-data