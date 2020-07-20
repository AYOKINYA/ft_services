IP=$(cat /ip.txt)
sed -i "s/MINIKUBE_IP/$IP/g" /etc/telegraf/telegraf.conf

cd /etc/telegraf/ && ./telegraf