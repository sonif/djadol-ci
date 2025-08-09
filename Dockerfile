FROM php:7.4-fpm-alpine

# Install dependencies for GD, MySQL, and other PHP extensions
RUN apk add --no-cache \
    libjpeg-turbo-dev \
    libpng-dev \
    freetype-dev \
    libzip-dev \
    zip \
    unzip \
    bash \
    mysql-client \
    && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip \
    && apk del bash  # optional: remove bash if not needed

# Set proper permissions for Apache to access files
RUN mkdir -p /var/www/html/uploads \
    && chown -R www-data:www-data /var/www/html/uploads \
    && chmod -R 775 /var/www/html/uploads

USER www-data