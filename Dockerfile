FROM php:7.4-apache

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install mysqli gd \
    && docker-php-ext-enable mysqli gd

# Aktifkan mod_rewrite untuk Apache
RUN a2enmod rewrite

# Copy kode CodeIgniter ke dalam container
COPY ./src /var/www/html

# Set proper permissions for Apache to access files
RUN mkdir -p /var/www/html/uploads \
    && chown -R www-data:www-data /var/www/html/uploads \
    && chmod -R 775 /var/www/html/uploads

# Set direktori kerja
WORKDIR /var/www/html/

# Expose port 80
EXPOSE 80

USER www-data