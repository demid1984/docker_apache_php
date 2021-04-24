FROM alpine:3.13

RUN apk --update \
    add apache2 \
    curl \
    unzip \
    php7-apache2 \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqli \
    php7-mysqlnd \
    php7-openssl \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-session \
    php7-xml \
    php7-xmlrpc \
    php7-intl \
    && rm -f /var/cache/apk/* \
    && sed -i 's/ErrorLog logs\/error\.log/ErrorLog \/proc\/self\/fd\/2/g' /etc/apache2/httpd.conf \
    && sed -i 's/CustomLog logs\/access\.log combined/#CustomLog logs\/access\.log combined/g' /etc/apache2/httpd.conf \
    && sed -i 's/#CustomLog logs\/access\.log common/CustomLog \/proc\/self\/fd\/1 common/g' /etc/apache2/httpd.conf

EXPOSE 80

WORKDIR /var/www/

RUN echo '<?php' > /var/www/localhost/htdocs/index.php \
    && echo 'phpinfo();' >> /var/www/localhost/htdocs/index.php \
    && echo '?>' >> /var/www/localhost/htdocs/index.php

ADD start.sh /etc/init.d/
ENTRYPOINT ["/etc/init.d/start.sh"]
