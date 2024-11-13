# Use the official WordPress image as base
FROM wordpress:latest

# Install required dependencies for PHP extensions
RUN apt-get update && apt-get install -y \
    git curl libpng-dev libonig-dev libxml2-dev \
    zip unzip libzip-dev libsodium-dev libfreetype6-dev \
    libjpeg62-turbo-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo_mysql mbstring exif pcntl bcmath zip \
    && apt-get clean && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists/*

# Copy the custom php.ini into the PHP configuration directory
COPY php.ini $PHP_INI_DIR/conf.d/

# Copy custom Apache configuration to the container
COPY apache2.conf /etc/apache2/sites-available/000-default.conf

# Enable mod_rewrite
RUN a2enmod rewrite
