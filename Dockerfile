FROM eslym/php7-aa:latest

ADD laravel.sh /extras/00-laravel

RUN chmod +x /extras/00-laravel &&\
    apk add --no-cache dcron php7-fileinfo &&\
    echo "* * * * * cd /var/www/html && php artisan schedule:run >> /dev/null 2>&1" > /etc/crontabs/apache &&\
    sed -i 's/\/var\/www\/html/\/var\/www\/html\/public/' /etc/apache2/httpd.conf

WORKDIR /var/www/html