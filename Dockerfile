# Use the official PHP image as a base
FROM php:8.2-apache

# Install necessary PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libicu-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql intl

    

RUN apt-get install -y wget
# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy the CakePHP application into the container
COPY . /var/www/html

# Copy the Apache configuration file to the appropriate location
COPY my-httpd.conf /etc/apache2/sites-available/000-default.conf


# Set the working directory
WORKDIR /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/tmp \
    && chmod -R 755 /var/www/html/logs



# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set environment variable to allow Composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install CakePHP dependencies
RUN composer install




# Expose port 80
EXPOSE 80

ARG VERSION
ARG ARCH
# RUN wget -q https://github.com/DataDog/dd-trace-php/releases/download/${VERSION}/datadog-php-tracer_${VERSION}_${ARCH}.deb && dpkg -i datadog-php-tracer_${VERSION}_${ARCH}.deb

RUN wget -q https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php && php datadog-setup.php --php-bin=all
CMD ["apache2-foreground"]
