#!/bin/sh

mkdir -p /usr/share/webapps/
cd /usr/share/webapps
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz

mv phpMyAdmin-5.0.2-all-languages /www
chmod -R 777 /usr/share/webapps/
