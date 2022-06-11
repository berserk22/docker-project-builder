#!/bin/bash

read -p "Your Project Name? [Demo] " project
read -p "Your Hostname? [demo] " hostname
read -p "Your Image? [demo_image] " image
read -p "Your Port for Hostname? [80] " port
read -p "Your Work Directory? " directory

echo docker run -d -p$port:80 --name $project -w $directory -v $directory:/var/www -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' -e PHP_INI_DIR='/usr/local/etc/php' -e APACHE_CONFDIR='/etc/apache2' -e APACHE_ENVVARS='/etc/apache/envvars' -e PHPIZE_DEPS='autoconf 		dpkg-dev 		file 		g++ 		gcc 		libc-dev 		make 		pkg-config 		re2c' -e PHP_EXTRA_BUILD_DEPS='apache2-dev' -e PHP_EXTRA_CONFIGURE_ARGS='--with-apxs2 --disable-cgi' -e PHP_CFLAGS='-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' -e PHP_CPPFLAGS='-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' -e PHP_LDFLAGS='-Wl,-O1 -Wl,--hash-style=both -pie' -e PHP_VERSION='7.4' $image
docker build -t $image .
docker run -d -p$port:80 --name $project -w $directory -v $directory:/var/www -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' -e PHP_INI_DIR='/usr/local/etc/php' -e APACHE_CONFDIR='/etc/apache2' -e APACHE_ENVVARS='/etc/apache/envvars' -e PHPIZE_DEPS='autoconf 		dpkg-dev 		file 		g++ 		gcc 		libc-dev 		make 		pkg-config 		re2c' -e PHP_EXTRA_BUILD_DEPS='apache2-dev' -e PHP_EXTRA_CONFIGURE_ARGS='--with-apxs2 --disable-cgi' -e PHP_CFLAGS='-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' -e PHP_CPPFLAGS='-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' -e PHP_LDFLAGS='-Wl,-O1 -Wl,--hash-style=both -pie' -e PHP_VERSION='7.4' $image