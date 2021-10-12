FROM php:7.3-fpm
 
#update packages
RUN apt-get update \
     && apt-get install -y libzip-dev \
     && docker-php-ext-install zip
# Set container's working dir
WORKDIR /app

# INSTALL COMPOSER
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
RUN alias composer='php composer.phar'

# Copy composer files from project root into composer container's working dir
COPY composer.* /app/
 
# Run composer to build dependencies in vendor folder
RUN set -xe \
 && composer install --no-scripts --no-suggest --no-interaction --prefer-dist --optimize-autoloader

# Generated optimized autoload files containing all classes from vendor folder and project itself
RUN composer dump-autoload --optimize --classmap-authoritative

# Copy everything from project root into php container's working dir
COPY . /app/

