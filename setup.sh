echo "Starting minikube..."
#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
export MINIKUBE_HOME=/Users/jkang/goinfre/
minikube config set vm-driver virtualbox
minikube start --extra-config=apiserver.service-node-port-range=1-35000
echo "Enabling addons..."

minikube addons enable metrics-server
minikube addons enable dashboard

echo "Launching dashboard..."
minikube dashboard &

echo "Eval... to link MINIKUBE AND DOCKER"
eval $(minikube docker-env)

#IP=$(minikube ip)
export IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "Minikube IP: ${IP}\n"

echo "Building images..."
docker build -t image_nginx ./nginx
docker build -t image_mysql ./mysql --build-arg IP=${IP}
docker build -t image_phpmyadmin ./phpmyadmin
docker build -t image_wordpress ./wordpress --build-arg IP=${IP}
#docker build -t image_grafana ./grafana
#docker build -t image_influxdb ./influxdb

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f metalLB_config.yaml

echo "Creating pods and services..."
kubectl create -f nginx.yaml 
kubectl create -f mysql.yaml
kubectl create -f phpmyadmin.yaml
kubectl create -f wordpress.yaml
#kubectl create -f grafana.yaml
#kubectl create -f influxdb.yaml

echo "Opening the network in your browser"
#open http://$IP
minikube service list