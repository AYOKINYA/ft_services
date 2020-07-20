#!/bin/sh

mysql_install_db --user=root
mysqld --user=root --bootstrap < /tmp/init_mysql.sh
sleep 5
IP=$(cat /ip.txt)
sed -i "s/192.168.99.152/$IP/g" /tmp/wordpress.sql
mysql wordpress < /tmp/wordpress.sql
mysqld --user=root