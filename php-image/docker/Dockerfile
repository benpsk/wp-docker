ARG VERSION

FROM php:${VERSION}-fpm

ARG VERSION

WORKDIR /var/www/html

# Install system dependencies # Install PHP extensions
RUN apt-get update && apt-get install -y \
    git curl \
    libpng-dev libonig-dev libxml2-dev \
    zip unzip libzip-dev libsodium-dev gnupg \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql mbstring mysqli exif pcntl bcmath gd \
    zip xml intl sodium

COPY php.ini /usr/local/etc/php/php.ini
COPY start-container.sh /usr/local/bin/start-container.sh
COPY my_cron_tab /etc/cron.d/my_cron_tab

RUN chmod +x /usr/local/bin/start-container.sh

ENTRYPOINT [ "start-container.sh" ]
