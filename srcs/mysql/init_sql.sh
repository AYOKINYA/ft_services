until mysql
do
	echo -n "" > /dev/null
done

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password && \
echo "CREATE USER 'wpuser'@'%' IDENTIFIED BY '123456789';" | mysql -u root --skip-password && \
echo "GRANT ALL ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password && \
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysql wordpress -u root --skip-password < /tmp/wordpress.sql