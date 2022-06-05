FROM ubuntu:18.04

#RUN docker-php-ext-install pdo pdo_mysql

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y software-properties-common language-pack-en-base
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php


#RUN apt-get -y update && apt-get install -yq \
#		libfreetype6-dev \
#		libjpeg62-turbo-dev \
#		libpng-dev \
#	&& docker-php-ext-install -j$(nproc) iconv gd

#install Imagemagick & PHP Imagick ext
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php7.4 \
    php7.4 \
    php7.4-cli \
    php7.4-gd \
    php7.4-json \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-xml \
    php7.4-xsl \
    php7.4-zip \
    php7.4-soap \
    php7.4-opcache \
    php7.4-curl \
    php7.4-bcmath \
    php-xdebug \
    php-mcrypt \
    mysql-client
#RUN pecl install imagick

#RUN pecl install pthreads
#RUN pecl install xdebug

# ======= PHP ZTS / Thread =====
#RUN php -r "echo PHP_ZTS;"
#RUN php -r "print_r(class_exists('Thread'));"

# ======= APACHE Host =====
COPY build/apache.conf /etc/apache2/sites-available/000-default.conf
COPY build/run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

RUN echo "<?php phpinfo();" >> /var/www/index.php

WORKDIR /var/www/
VOLUME /var/www

EXPOSE 80 443

#CMD ["/usr/local/bin/run", "apache2ctl", "-D", "FOREGROUND"]
CMD ["/usr/local/bin/run"]