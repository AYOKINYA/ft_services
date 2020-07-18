#!/bin/sh

mysql_install_db --user=root
mysqld --user=root --bootstrap < /tmp/init_mysql.sh
mysqld --user=root