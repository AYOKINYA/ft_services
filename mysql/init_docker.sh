#!/bin/sh

mysql_install_db --user=root
mysqld --user=root --bootstrap < /tmp/init_mysql.sh
sleep 5
IP=$(cat /ip.txt)
sed -i "s/192.168.99.152/$IP/g" /etc/wordpress/wp-config.php
mysql -u root -p wordpress < wordpress.sql
mysqld --user=root