FROM php:8.2-fpm

# Argumentos
ARG user=gestao
ARG uid=1000

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    zip \
    unzip \
    nodejs \
    npm

# Limpar cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar extensões PHP
RUN docker-php-ext-install pdo pdo_pgsql pgsql mbstring exif pcntl bcmath gd

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Criar usuário do sistema
RUN useradd -G www-data,root -u $uid -d /home/$user $user \
    && mkdir -p /home/$user/.composer \
    && chown -R $user:$user /home/$user

# Definir diretório de trabalho
WORKDIR /var/www

# Mudar para usuário criado
USER www-data

# Expor porta
EXPOSE 8000

# Copiar configuração customizada do PHP-FPM
COPY php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

# Comando padrão NÃO usa php-fpm (porque estamos usando php -S)
CMD ["php-fpm"]

