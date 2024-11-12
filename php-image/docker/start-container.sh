#!/usr/bin/env bash

APPENV=${APPENV:-production}

echo "App running on $APPENV environment."

chown -R www-data:www-data wp-content

# run php-fpm
/usr/local/sbin/php-fpm -F

# Start cron in the foreground
cron &
