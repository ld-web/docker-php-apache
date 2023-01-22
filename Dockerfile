FROM php:8.2-apache
RUN apt-get update && apt-get install -y --no-install-recommends git wget zlib1g-dev libzip-dev unzip libicu-dev libonig-dev
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
  -t agnoster \
  -p git
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN sed -i 's|memory_limit = 128M|memory_limit = 1024M|g' ${PHP_INI_DIR}/php.ini
RUN sed -i 's|upload_max_filesize = 2M|upload_max_filesize = 8M|g' ${PHP_INI_DIR}/php.ini
RUN sed -i 's|;realpath_cache_size = 4096k|realpath_cache_size = 4096k|g' ${PHP_INI_DIR}/php.ini
RUN sed -i 's|;realpath_cache_ttl = 120|realpath_cache_ttl = 600|g' ${PHP_INI_DIR}/php.ini
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN docker-php-ext-install pdo_mysql \
  && docker-php-ext-install intl \
  && docker-php-ext-install zip
RUN apt-get install -y vim locate
RUN pecl channel-update pecl.php.net \
  && pecl install xdebug-3.2.0
RUN updatedb
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
WORKDIR /var/www/html
EXPOSE 80
