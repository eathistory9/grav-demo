# Folosește PHP CLI 8.1
FROM php:8.1-cli

# Setează folderul de lucru
WORKDIR /var/www/html

# Copiază toate fișierele proiectului
COPY . .

# Instalează extensiile necesare pentru Grav
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip unzip \
    && docker-php-ext-install gd intl zip

# Setează permisiuni corecte pentru Grav
RUN chown -R www-data:www-data /var/www/html/user /var/www/html/cache /var/www/html/logs

# Expune portul folosit
EXPOSE 10000

# Rulează Grav PHP built-in server
CMD ["php", "-S", "0.0.0.0:10000", "system/router.php"]
