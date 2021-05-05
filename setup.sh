# deleting the current minikube, if it exists
minikube delete

#1
minikube start 	--driver=virtualbox \
                --cpus=2 --memory=2048 --disk-size=10g \
                --addons metallb \
                --addons dashboard


# 2
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

# 3
eval $(minikube docker-env)

# 4
kubectl create serviceaccount sfeith	
kubectl apply -f srcs/service_account.yaml

# 5
docker build -t phpmyadmin ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# 6
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

# 7
docker build -t ftps ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml

# 8
docker build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

# 9
docker build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# 10
docker build -t influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

# 11
docker build -t telegraf ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/telegraf.yaml

# 12
docker build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml



