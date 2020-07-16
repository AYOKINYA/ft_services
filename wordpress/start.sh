#!/bin/sh

IP=$(cat /ip.txt)

sed -i "s/MINIKUBE_IP/$IP/g" /etc/wordpress/wp-config.php
php -S 0.0.0.0:5050 -t /etc/wordpress/