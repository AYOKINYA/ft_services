IP=$(cat /ip.txt)
sed -i "s/192.168.99.152/$IP/g" /tmp/wordpress.sql
echo "inserting data into worpress databases"
mysql < /tmp/wordpress.sql
sleep 5