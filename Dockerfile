# Use an official PHP image with Apache
FROM php:7.4-apache

# Enable Apache mod_rewrite for CodeIgniter
RUN a2enmod rewrite

# Set the working directory in the container
WORKDIR /var/www/html

# Copy project files into the container
COPY . /var/www/html

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli

# Set proper permissions for Apache to access files
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80