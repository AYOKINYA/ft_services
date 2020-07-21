IP=$(cat /ip.txt)
sed -i "s/192.168.99.152/$IP/g" /tmp/wordpress.sql

nohup sh /tmp/init_sql.sh &

/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"