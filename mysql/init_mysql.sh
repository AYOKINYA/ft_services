#!/bin/bash

until mysql
do
    echo "NO_UP"
done

mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'wpuser'@'%' IDENTIFIED BY '123456789';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "update mysql.user set plugin = 'mysql_native_password' where user='root';"
