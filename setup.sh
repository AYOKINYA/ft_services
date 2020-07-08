echo "Starting minikube..."
#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
export MINIKUBE_HOME=/Users/jkang/goinfre/
minikube config set vm-driver virtualbox
minikube start --extra-config=apiserver.service-node-port-range=1-35000
echo "Enabling addons..."

minikube addons enable dashboard
minikube addons enable ingress
echo "Launching dashboard..."
minikube dashboard &

echo "Eval..."
eval $(minikube docker-env)

#IP=$(minikube ip)
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "Minikube IP: ${IP}\n"

echo "Building images..."
docker build -t service_nginx ./nginx


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f config.yaml

echo "Creating pods and services..."
kubectl create -f nginx.yaml

echo "Opening the network in your browser"
#open http://$IP