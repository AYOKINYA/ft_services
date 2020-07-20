#!/bin/sh

mysql_install_db --user=root
mysqld --user=root --bootstrap < /tmp/init_mysql.sh
IP=$(cat /ip.txt)
sed -i "s/192.168.99.152/$IP/g" /tmp/wordpress.sql
mysql -u root wordpress < /tmp/wordpress.sql
sleep 5
mysqld --user=root