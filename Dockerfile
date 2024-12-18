FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y software-properties-common language-pack-en-base
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y \
    nginx \
    php8.1 \
    php8.1-fpm \
    php8.1-gd \
    php8.1-ldap \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-xml \
    php8.1-xsl \
    php8.1-zip \
    php8.1-soap \
    php8.1-opcache \
    php8.1-curl \
    php8.1-bcmath \
    php8.1-apcu \
    php-xdebug \
    php-mcrypt \
    mysql-client \
    curl \
    nano \
    wget


#COPY build/nginx.conf /etc/nginx/sites-available/default


COPY build/nginx.conf /etc/nginx/sites-available/default

COPY build/php_pool.conf /etc/php/8.1/fpm/pool.d/www.conf


#COPY build/apache.conf /etc/apache2/sites-available/000-default.conf
COPY build/run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
#RUN a2enmod rewrite

#RUN echo "<?php phpinfo();" >> /var/www/index.php

WORKDIR /var/www/
VOLUME /var/www

EXPOSE 80

CMD ["/usr/local/bin/run", "nginx", "FOREGROUND"]
#CMD ["/usr/local/bin/run"]