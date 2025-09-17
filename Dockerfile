FROM php:8.2-apache

# Instalează extensiile de care are nevoie Grav
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libicu-dev \
    && docker-php-ext-install zip gd intl

# Copiază toate fișierele proiectului în container
COPY . /var/www/html/

WORKDIR /var/www/html/

EXPOSE 10000

CMD ["php", "-S", "0.0.0.0:10000", "-t", "."]
