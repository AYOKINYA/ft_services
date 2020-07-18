FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'%' IDENTIFIED BY '123456789';
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
#update mysql.user set plugin = 'mysql_native_password' where user='root';