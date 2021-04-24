#!/bin/sh

if [ -z $DOCUMENT_ROOT ]
then
    DOCUMENT_ROOT='public_html'
fi

host=$(hostname)
if [ -e "/home/$host.zip" ]
then
    mkdir "/var/www/$host"
    sed -i "s/\/var\/www\/localhost\/htdocs/\/var\/www\/$host\/$DOCUMENT_ROOT/g" /etc/apache2/httpd.conf

    cd /var/www/$host
    unzip -q /home/$host.zip
    rm /home/$host.zip
fi

httpd -D FOREGROUND
