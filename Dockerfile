FROM php:7.4-apache

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Set proper permissions for Apache to access files
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html