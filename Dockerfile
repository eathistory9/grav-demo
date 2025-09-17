FROM php:8.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd intl zip

# Enable Apache rewrite
RUN a2enmod rewrite

# Copy Grav files
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Start Grav using PHP built-in server with router
CMD ["php", "-S", "0.0.0.0:10000", "system/router.php"]
