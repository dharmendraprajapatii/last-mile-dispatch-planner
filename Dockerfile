FROM php:8.4-cli

# Install system packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libzip-dev \
    zip \
    libicu-dev \
    libonig-dev \
    && docker-php-ext-install pdo pdo_mysql zip mbstring bcmath intl

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY . .

RUN chmod +x docker/entrypoint.sh

EXPOSE 8000

CMD ["sh", "docker/entrypoint.sh"]