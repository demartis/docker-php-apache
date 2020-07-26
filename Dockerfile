ARG PHP_VERSION=7.4

FROM php:$PHP_VERSION-apache-buster

ARG DEBIAN_FRONTEND=noninteractive

#
# Setup Debian & PHP
#
RUN \
# \
# php version specific params \
case "${PHP_VERSION}" in \
  "7.4"*) export PHP_GD_OPTIONS="--with-freetype --with-jpeg";; \
  *)      export PHP_GD_OPTIONS="--with-gd --with-freetype-dir=/usr/include/ --with-webp-dir=/usr/include/ --with-jpeg-dir=/usr/include/" && export PHP_ZIP_OPTIONS="--with-ziplib";; \
esac &&\
echo configuring ${PHP_VERSION} with gd options: $PHP_GD_OPTIONS and zip options: $PHP_ZIP_OPTIONS && \
# \
# start setup \
apt-get -y update --fix-missing && \
    apt-get -y upgrade && ACCEPT_EULA=Y && \
    apt-get -y install --no-install-recommends --fix-missing \
        unzip \
        libtidy-dev \
        libssl-dev \
        zlib1g-dev \
        libpng-dev \
        libwebp-dev \
        libgmp-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        libicu-dev \
        libmcrypt-dev \
        libmemcached-dev \
        libgeoip-dev \
        libxml2-dev \
        libxslt-dev \
        libtidy-dev && \
    pecl install redis && \
    pecl install geoip-1.1.1 && \
    pecl install apcu && \
    pecl install memcached && \
    pecl install timezonedb && \
    pecl install mcrypt && \
    docker-php-ext-configure gd ${PHP_GD_OPTIONS} && \
    docker-php-ext-configure zip ${PHP_ZIP_OPTIONS} && \
    docker-php-ext-install calendar exif gettext intl mysqli pcntl pdo_mysql shmop sockets && \
    docker-php-ext-enable opcache redis apcu memcached timezonedb mcrypt && \
    apt-get -y -q autoremove --purge && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#
# Install Composer
#
RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig && \
    curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig && \
    php composer-setup.php && rm composer-setup.php* && \
    chmod +x composer.phar && mv composer.phar /usr/bin/composer

#
# Configure Apache
#
RUN a2enmod proxy && \
    a2enmod proxy_http && \
    # a2enmod proxy_ajp && \
    a2enmod rewrite && \
    a2enmod deflate && \
    a2enmod headers && \
    a2enmod proxy_balancer && \
    a2enmod proxy_connect && \
    a2enmod ssl && \
    a2enmod cache && \
    a2enmod expires && \
    # Run apache on port 8080 instead of 80 due. On linux, ports under 1024 require admin privileges and we run apache as www-data.
    # sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf && \
    # sed -i 's/Listen 443/Listen 8443/g' /etc/apache2/ports.conf && \
    chmod g+w /var/log/apache2 && \
    chmod 777 /var/lock/apache2 && \
    chmod 777 /var/run/apache2 && \
    echo "<?php echo phpinfo(); ?>" > /var/www/html/phpinfo.php
