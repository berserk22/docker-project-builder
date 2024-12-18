#!/bin/bash
set -e

#PHP_ERROR_REPORTING=${PHP_ERROR_REPORTING:-"E_ALL"}
#sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php/8.1/fpm/php.ini
#sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php/8.1/cli/php.ini
#sed -ri "s/^error_reporting\s*=.*$//g" /etc/php/8.1/fpm/php.ini
#sed -ri "s/^error_reporting\s*=.*$//g" /etc/php/8.1/cli/php.ini
#echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php/8.1/fpm/php.ini
#echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php/8.1/cli/php.ini

#source /etc/apache2/envvars &&
service php8.1-fpm start && service nginx start