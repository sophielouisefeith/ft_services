notes
***************************************************************************************************
Setup.sh

1.starting minikube's original driver, which is virutalbox and enabling MetalLB and kubernetes' dashboard
2.preparing MetalLB
3.connecting to the docker environment that is running in the cluster
4.creating my service account
5.building my phpmyadmin image and deploying the container
6.building my nginx image and deploying the container
7.building my ftps image and deploying the container
8.building my mysql image and deploying the container
9.building my wordpress image and deploying the container
10. building my influxdb image and deploying the container
11.building my telegraf image and deploying the container
12.Grafana
13.
14.

••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
#                           loadbalancer
#   Grafana             Wordpress       nginx      PhpMyAdmin         FTPS
#
#   influxdb                                                            MYSQL
#

# service		user		password	db_name		hostname	db_charset
# Grafana:		admin		admin
# phpMyAdmin:	admin		admin
# Wordpress:	sfeith		halloGoed!1		wordpress	mysql		utf8
# SSH: 			int the terminal "ssh sfeith@192.168.99.220 -p 22"
				# password: halloGoed!1

# to enter a container:
# kubectl exec pod_deployment -it -- sh

#get all
#kubectl exec deploy/mysql -- pkill mysql
#kubectl get deployments
#kubectl get services.
#kubectl get all
#kubectl delete -n default pod influxdb-6b648fbcf4-xtj4l
#Kubectl run nginx —image nginx

#commands 

# clusterIP and loadbalancer what is the difference. 
# ftps doet het niet met uploaden alleen dowloandden
# wat is admin van wordpress 

***********************************************************************************************************************

FTPS:

# FTPS is the same as FTP but it uses SSL to protect the FTP. 
# FTP is used for file exchange between computers. One computer 
# is the FTP server and the other one is the client.


# 1.updating the packagelist and installing the necessary packages
# 2.creating a folder for the new user for FTP
# 3.creating a new user in the correct map
# 4.creating new key and ssl certificate and putting them in the right directory
# 5.place files inside container
# 6.open ports
# 7.run script to get the right IP addres


**********************************************************************************************************

Grafana:
Grafana is a open source analytics & monitoring solution for every database.
1.updating the packagelist and installing the necessary packages
2.download and unpack grafana
3.copy grafana.db to the correct location
4.exposing the correct port
5.going to the correct workdirectory and start the grafana server


***********************************************************************************************************************

# InfluxDB is an open-source time series database (TSDB). It is optimized for fast, 
# high-availability storage and retrieval of time series data. It works with Grafana.

***********************************************************************************************************************

# MySQL Database Service is a fully managed database service to deploy 
# cloud-native applications using the world’s most popular open source database. 
# SQL is the language used to create, modify and extract data from the relational 
# database, as well as control user access to the database.

1.update and upgrade the apk package manager and install mysql
2.copying the mysql config and the startup script
3.giving the start script the correct execute permission
4.exposing the correct port
5. executing so it keeps running


***********************************************************************************************************************

nginx

# NGINX is a open source HTTP web server, mail proxy server, and reverse proxy and 
# load balancer for HTTP, TCP, and UDP traffic. NGINX is known for its high performance, 
# stability, rich feature set, simple configuration, and low resource consumption.




1.update the apk package manager and install nginx, openssl and openssh
2.creating a folder for nginx.pid and for www
3. adding user www for nginx
4.changing the user ID for the hierarchies rooted in the files
5.creating new key and ssl certificate and putting them in the right directory
6.copying the nginx configuration file and the index page to the container
7.adding a user for the ssh and changing the password everywhere
8.copy the startup.sh to the container
9.give the correct execution rights to the start.sh
10.expose the correct ports
11.give the command to start the container

# This configuration file filters the incoming requests and redirects them.
# A redirection is a way to sent both user and serach engines to a different
# URL from the one they orginally requested.
# Port 80 = HTTP = non SSL, with redirection type 301 ("Moved Permanently") to port 443.
# Port 443 = HTTPS = with SSL, so a redirection from HTTP to HTTPS is established.
# Error 497 is a http request to a https listener, when this happen I show a redirected website.

# When you are in the minikube-dashboard -> nginx -> nginx-service, there are three URL's;
# If you click on the first URL, and then enter 'thisisunsafe' (in Chrome) it will show you
# a redirected page
# If you enter /wordpress after the second URL it redirects you to wordpress,
# if you enter /phpmyadmin after the second URL it redirects you to phpmyadmin 
# by using a reversed proxy.
# The third URL is a redirection to port 22 (SSL port), which gives a 'page not found', which is fine.













***********************************************************************************************************************



phpmyadmin

# phpMyAdmin is a software tool written in PHP, intended to handle 
# the administration of MySQL over the Web.

1.update the apk package manager and install php and nginx
2.creating the necesarry folders
3.downloading and unpacking PHPMyAdmi
4.adding user www for nginx
5.changing the user ID for the hierarchies rooted in the files
6.copying the configuration files and the start file to the correct directories
7.give the start script permission to execute
8.expose the 5000 port for PHP
9.make sure that the container keeps running


***********************************************************************************************************************


telegraf

# Telegraf is a plugin-driven server agent for collecting and sending metrics
# and events from databases, systems, and IoT sensors.

1.downloading and installing telegraf
2.putting the configuration file in the correct directory
3.exposing port 8125
4.make sure that the container keeps running

***********************************************************************************************************************

1. update the packagelist and install necessary packages
2.creating a folder for nginx.pid and a folder for the user
3.adding user www for nginx 
4.changing the user ID for the hierarchies rooted in the files
5.# download the wordpress command line interface, this also provides the terminal
# with recognizing the 'wp' in the start.sh file
6.# first making sure you are in the correct directory and then 
# downloading the latest wordpress source files
7.set the workdir back
8.copying the configurations and the start script
9.give yourself the execute rights for the start and wp-config script
10. expose the correct port
11.make sure that the container keeps running



***********************************************************************************************************************

Wordpress

***********************************************************************************************************************








Containers
Containers are completely isolated environments. As in they can have their own processes or services, their own networking interface, just like virtual machines. Except they all share the same underlying operating system Kernel. Explained; Let’s say we have a system with Ubuntu OS with docker installed on it. Docker can run any flavor of OS on top of it as long as they are all based on the same Kernel, in this case Linux. Each Docker container only has the additional software that makes these operating systems different and Docker utilizes the underlying kernel of Docker host which works with all the operating systems above. So you can’t host a Windows based container on a Docker host with Linux OS on it (not the same kernel). Docker is not meant to virtualize and run different operating systems and kernels on the same hardware. The main purpose of Docker is to containerize applications and to ship and run them.

Operating systems always consist of two things; an OS Kernel and a set of software. The operating system Kernel is responsible for interacting with the underlying hardware while the OS Kernel remains the same which is Linux in this case, it is the software above it that makes these operating systems different. This software may consist of a different user interface, drivers, compilers, file managers, developer tools etc. So you have a common Linux Kernel shared across all operating systems and some custom software that differentiates operating systems from each other. 

Containers vs Virtual Machines
In case of Docker we have the underlying hardware infrastructure, then the operating system and Docker installed on the operating system. Docker can then manage the containers that run with libraries and dependencies alone.
In case of a virtual machine we have the OS on the underlying hardware, then the hypervisor and then the virtual machine. So each virtual machine has its own operating system inside it. Then de dependencies and then the application.

Containers vs images
An image is a package or a template just like a virtual machine template. It is used to create one or more containers.
Containers are running instances of images that are isolated and have their own environment and of processes.

A dockerfile is used to make an image that can be run anywhere by using Docker.
A container only lives as long as the process inside it is alive. So a container exists automatically when the process is over.

Docker engine
This is simply the host with Docker installed on it. If you’re installing Docker, you are actually installing three different thins:
Docker CLI, this is the command line interfaces to perform actions such as running a container.
REST API, this is the API(Application Programming Interface) interface that programs can use to talk to the deamon and provide instructions.
Docker Deamon, this is a background process that manages docker objects such as images, containers, volumes and networks.

Docker storage
How Docker stores data and how it manages file systems of the containers:
If you install Docker, it creates this folder structure at var/lib/docker and you have multiple folders under it such as aufs, containers, images, etc. This is where Docker stores als his data by default.

Dockers layered architecture
When Dockers builds images, it builds these in a layered architecture/structure. Each line of instructions in the Docker file creates a new layer in Docker image with just the changes from the previous layer. The first layers have the most weight since you have to start with installing things, after that you build further on these layers with smaller items. The benefit about this layers
system, is then when Docker builds a new Dockerfile and the first layers are already build and run in another file, he can re-use these layers. This way Docker builds images faster en efficiently and it saves disk space.
Common architecture for the Docker Image layers:
Base (ubuntu layer)
Changes in apt packages
Changes in pip packages (dependencies)
Source code
Update entry point with “flask” command (example)
Once this build is complete, you can not modify the contents of these layers and so they ar read only and you can only modify them by initiating a new build.
When you run a container based off of this image, using the Docker run command, Docker creates a container based off of these layers and creates a new writable layer on top of this image.
Container layer
The read and writable layer is used to store data created by the container such as log files used by the application, any temporary files generated by the container or just a file modified by the user on that container. The life time of this layer though is only as long as the container is alive. When the container is destroyed, this layer and all of the changes stored in it are also destroyed. So you can build different containers based on the same image.

Docker networking
When you install Docker it creates three networks automatically; 
bridge, the default network a container gets attached to. This is a private internal network created by Docker on the host. All containers attached to this network by default and they get an internal IP address. The containers can access each other by using this internal IP. To acces any of these container from the outside world, you should map the ports of these containers to the ports on the Docker host.
	docker run ubuntu
none, the Fontaine’s are not attached to any network and doesn’t have any acces to the external network or other containers. They run in an isolated network.
	docker run ubuntu —network=none
host, another way to acces the containers is to associate the container to the host network. This takes out any network isolation between the Docker host and the Docker container. So it is accessibly without requiring any port mapping.
	docker run ubuntu —network=host

Docker registry
This is where all the images are stored. Push to save, and pull to use.

Docker commands
Docker run nginx
	The docker run command is used to run a container (on the foreground) from an image. 	‘docker run nginx’ will run an instance of the nginx application on the docker host if it 			already exists. If the image is not present on the host, Docker wil go to Docker Hub and 		pull the image down.
Docker ps
	The ps command gives a list of all running containers and some basic information about 		them.
Docker ps -a
	This shows all running and previously stopped or exited containers.
Docker stop <container ID>
	To stop a docker container.
Docker rm <container name>
	To remove the container permanently.
Docker images
	Gives a list of the images present on our host.
Docker rmi <image name>
	To remove an image. Make sure that no containers are running off that image before 			attempting to remove it. First delete the containers.
Docker pull <image name>
	To just pull an image without running it, so it get stored on your host.
Docker exec <container name> cat /etc/hosts
	To print the contents of the etch/hosts file.
Docker run -d <image name>
	This will run the docker container in the background mode and you will be back to your 			prompt immediately. So it will react on your terminal while it is running.
Docker attach <container ID>
	To attach back to the running container.
Docker run -it nginx bash
	-it means that I’m logged in on the container and bash redirects you to the docker 			terminal(?). If you now run ‘cat /etc/*release*’ you can see that you are in the container.
Docker run -d nginx sleep 20
	The -d is to run it in the backgroud, the ‘sleep 20’ is to keep it alive for 20 secondes, so it 		will be visible with ‘Docker ps’ for 20 seconds.
Docker run -p 80:5000 <container_name>
	To map port 5000 to port 80 on the Docker host so that users can access the application. 		You can only map one container to one port.
Docker inspect <container_name>
	Returns all details of a container in a JSON format.
Docker run —cpus=.5 nginx
	This will ensure that the container does not take up more than 50 percent of the hosts CPY 	at any given time.
Docker run —memory=100m nginx
	This limits the amount of memory the container can use to 100 megabytes.
Docker volume create data_volume
	It creates a folder under the /var/lib/docker/volumes called data_volume.

When you run a command at startup, it will override the same command in the docker file with the new value. For example; in the Docker file ‘sleep 5’ in the command; ‘docker run nginx sleep 10’, now the container will sleep 10 seconds instead of 5.

When databases and tables are created (such as mysql), the data files are stored in /var/lib/mysql, since a Docker container has it’s own isolated file system. When you delete this container, all the data is lost. If you do want to delete the container but want to keep the data, you map it to a different directory;
Docker run -v /opt/directory_name:/var/lib/mysql mysql
Now your data is stored in an external directory form you container. And thus will remain even though you delete the container.

With ‘tags’ you can explain which version of a certain image you want.

Images
How to create an image:
Set up a Docker file named Docker file and write down the instructions for setting up your application. Such as installing the dependencies, where to copy the source code to and what the entry point of the application is, etc:
	FROM Ubuntu
	RUN apt-get update
	RUN apt-get install python
	RUN pip install flask
	RUN pip install flask-mysql
	COPY . /opt/source-code
	ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run
Build your image using ‘docker built’ and specify  the docker file as input as well as a tag name for the image:
	docker build Dockerfile -t mmourik/my-custom-app
    This will create an image locally on your system.
To make it available on the public Docker Hub registry, run the ‘docker push’ command and specify the name of the image you just created
	docker push mmourik/my-custom-app

When Docker builds the images, it builds these in a layered architecture. Each line of instructions creates a new layer in the docker image with just the changes form the previous layer.

Docker file
Every file starts with FROM, this is to announce the base operating system and this is another image. Every Docker image must be based on another image (Ubuntu/Alpine) or another operating system.
The RUN instructs Docker to run a particular command on those base images and install the dependencies for it.
COPY copies files from the local system into the Docker image.
ENTRYPOINT allows us to specify a comment that will be run when the image is run as a container

Docker orchestration
Docker orchestration is a solution that consists of a set of tools and scripts that can help host containers in a production envrionment. Typical a container orchestration solutions consist of multiple Docker hosts that can host containers. That way, if one fails the application is still accessible through the others. A container orchestration solution easily allows you to deploy hundreds of thousands of instances of you application with a single command. Orchestrations also provide support for advances networking between these containers across different hosts. As well as load balancing, user requests, support for sharing storage between the host as well as support for configuration. If a container fails, you should detect it and run it again.

Docker and Kubernetes
Kubernetes is a container orchestration solution for Docker. Kubernetes uses Docker hosts to host applications in the form of Docker containers.
A Kubernetes cluster consists of a set of nodes. A cluster is a set of nodes grouped together this way that even if one node fails, you have you application still accessible through the other nodes.
A node is a machine, physical or virutal, on which the Kubernetes set of tools are installed. A node is a worker machine and that is where containers will be launched by Kubernetes.
The master is a node with the Kubernetes control plane components installed. The master watches over the nodes in the cluster and is responsible for the actual orchestration of containers on the worker nodes.

Kubernetes architecture 
A node(or minions) is a machine, physical or virtual on which Kubernetes is installed. A node is a worker machine and that is where containers will be launched by Kubernetes. A cluster is a set of nodes grouped together. This way even if one node fails, you have your application still accessible from the other nodes. Having multiple nodes helps in sharing load as well. The Master is another node with Kubernetes installed in it and is configured as a Master. The Master watches over the nodes in the cluster and is responsible for the actual orchestration of containers on the worker nodes.

When you install Kubernetes on a system, you’re actually installing the following components: an API server, and etcd server, a kubelet service, a Container Runtime, Controller and Schedulers. 
The API server acts as the front end for Kubernetes. The users, management devices, command line interfaced, all talk to the API server to interact with Kubernetes cluster.
Etcd is a distributed reliable key value store used by Kubernetes to store all data used to manage the cluster. When you have multiple nodes and multiple Masters in your cluster, etcd stores all that information on all the nodes in the cluster in a distributed manner. Etcd is responsible for implementing looks within cluster to ensure that there are no conflicts between the Masters. 
The Scheduler is responsible for distributing work or containers across multiple nodes. It looks for newly created containers and assigns them to nodes.
The Controllers are the brain behind orchestration. They are responsible for noticing and responding when nodes, containers or end points go down. The Controllers make decisions to bring up new containers in such cases.
The Container Runtime is the underlying software that is used to run containers. In this case it is Docker.
Kubulet is the agent that runs on each node in the cluster. The agent is responsible for making sure that the containers are running on the nodes as expected.

How does one server become the master and another server become the ‘slave’. The worker node is where the containers are hosted, for example Docker containers. And to run Docker containers on a system, we need container runtime installed and that is where the container runtime falls, in this case it happens to be Docker. The master server has the kube API server and that is what it makes the master. Similarly, the worker nodes have the kubelet agent that is responsible for interacting with a master to provide health information of the worker node and carry out actions requested by the Master on the worker nodes. All the information gathered are stored in a key value store on the master. The key value store is based on the popular etcd framework as stated before. The master also has the Control Manager and Scheduler. 

Kube command line tool, or kubectl or kube control
The kube control is used to deploy and manage applications on a Kubernetes cluster. To get cluster information, to get the status of other nodes in the cluster and to manage many other things. 
Kubectl run nginx —image=nginx
	This command is used to deploy an application on the cluster. This command actually 			creates a deployment(without a definition file) and not just a pod. Still it is recommended 		to use a definition file because it is clearer and you can define and change more things.
Kubectl cluster-info
	This command is used to view information about the cluster.
Kubectl get nodes
	This is used to list all the nodes that are part of the cluster.
Kubectl run redis —image=redis123
	creating a pod with name ‘redis’ and an image named ‘redis123’
Kubectl apply -f pod.yml (<yaml_file>)	
	to launch the Yaml file
Kubectl get pods 
	To show a small overview from the pods
Kubectl describe pod nginx(<pod_name>)	
	To get more information
Kubectl get pods -o wide
	Another way to get more information
Kubectl get replicationcontroller
	Shows the status of the current replication controllers.
Kubectl replace -f replicaset-definition.yml
	To replace or update a file by giving it the same name.
Kubectl scale —replicas=6 -f replicaset-definition.yml
	Does the same as the previous, but then it updates only the given paramater in the given 		file, but he doesn’t change it in the Yaml file.
Kubectl create -f file.yml
	To create an object in Kubernetes.
Kubectl get replicaset
	To get a list of the replica sets
Kubectl get deployments
	To get a list of the deployments
Kubectl delete replicaset my_replicaset
	To delete an replicaset.
kubectl edit replicaset myapp-replicaset
	Opens the file (not the original yaml file) in vim so you can make some changes. As soon 		as you save this file the changes are implemented. 
Kubectl get all
	To see all the created objects.
Kubectl rollout status deployment/<name_of_your_deployment>
	To see the status of your rollout
Kubectl rollout history deployment/<name_of_your_deployment>
	To see the revision and history of your deployment.
Kubectl rollout undo deployment/<name_of_your_deployment>
	The deployment will destroy the pod in the new replica set and bring the older ones up in 		the old replica set. And your application is back to it’s older format.
Kubectly apply -f deployment-definition.yaml
	To update the deployments.
Minikube service <myapp-service> —url
	Gives the url from where the service is available

Kubectl rolling-update my-web-server —image =web-server:2	//meer over opzoeken
Kubectl rolling-update my-web-server —rollback	//meer over opzoeken


docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname

Minikub
Minikub bundles all of these different components (etcd, node-controller, replica-controller, kubulet, container runtime) into a single image providing as a provided single node Kuburnetes cluster.

POD
A pod is a single instance of an application. A pod is the smallest object that you can create in Kubernetes. Kubernetes does not deploy containers directly on the worker nodes, the containers are encapsulated into a Kubernetes object known as a pod. Pods usually have a one to one relationship with containers running your application. To scale up you create new pods and to scale down you delete them. You do not add additional containers to scale up your application. When there are multiple containers in a pod, they can communicate with each other by referring to each other as local host since they share the same network space plus they can easily share the same storage place as well.
A container is in a pod and the pod is in a node(Docker).

How to deploy PODS
Kubectl run nginx —image nginx
What this command really does is it deploys a docker container by reading a pod. So it first creates a pod automatically and deploys an instance of the nginx docker image. You need to specify the image name by using the —image paramater. The application image, in this case the nginx image, is downloaded from the Docker hub repository.
Now the webserver is not accessible for external users, but you can access it internally through the node. 

YAML
A Yaml file is used to represent data. In this case configuration data.
Syntax:
Yaml uses key value pairs:
	Fruits(key) : lemon(value)
Fruits:
Orange
Apple
Banana
The - indicates that it is an element of an array.

A dictionary is a set of properties grouped together under an item;
Banana:
	Calories: 62
	Fat: 0.3 g
	Carbs: 16 g

Spaces are really important in Yaml. In previous example everything fall within banana, but if we add spaces like this;
Banana:
	Calories: 62
	   Fat: 0.3 g
	   Carbs: 16 g
Now Fat and Carbs fall under Calories

Dictionary vs List vs List of dictionaries:
To store different information or properties of a single object you use a dictionary.
If you want to split an object with different values (splitting object Color in Dark and Light) you make a dictionary within a dictionary.
If you want to store multiple items of the same type of objects.
If you want to give more information from list of object, we make a list of dictionaries.

A dictionary is an unordered collection whereas lists are ordered collections. So in a list the order of items matter.
Example dictionary: 
Banana:					Banana:
	Calories: 62					Calories: 62	
	Fat: 0.3 g					Carbs: 16 g
	Carbs: 16 g					Fat: 0.3 g
This holds the same information even though the order is different, so it are the same directories.

In lists and arrays this will not be the same because the order is not the same:
Fruits:	
- Orange 
Apple
Banana

Fruits:	
- Orange 
Banana
Apple

This is important to know when working with data structures. 
Every line beginning with a ‘#’ is ignored and considered as a comment.

Kubernetes and Yaml
Kubernetest uses Yaml files als inputs for the creation of objects such as POD’s, replicas, deployment services, etc. All of these follow a similar structure. A Kubernetes definition file always contains 4 top level fields:
apiVersion: v1			//apps/v1, extensions/v1Beta
kind: Pod			//replica set, deployment, service
metadata:
	name: myapp-pod
	labels: 
	     app: myapp
	     type: front-end
spec:				//as in specification
	containers:
	     - name: nginx-container
	        image: nginx
	

These are the root lever properties. These are also required fields so you must have them in your configuration file.
The apiVersion is the version of Kubernetes API you’re using to create the objects. When you’re working with Pod’s you set the version on v1.
The kind refers to the type of object we are trying to create which in this case happens to be a POD. 
The metadata is data about the object like its name, labels, etc. This is in the form of a dictionary. So ‘name’ and ‘labels’ are children of metadata. ‘labels’ is also a dictionary. You can only name things under metadata that Kubernetes expects. So you can’t add any proporties that does not exist within Kubernetes. But under labels you can have any kind of key or value pairs as you wish. It is important to understand what each of these paramaters expect.
In the spec you provide additional information concerning the object. This is gonna be different for different objects. Spec is a dictionary. Containers is a list (or an array).

Running a Yaml file (a pod)
Make sure you made a Yaml file with the specifications from above.
Run:
Kubectl apply -f pod.yml (<yaml_file>)	//to launch it
Kubectl get pods 		//to see if it is active
Kubectl describe pod nginx(<pod_name>)	//to get more information
Kubectl get pods -o wide
	Another way to get more information

Kubernetes and controllers
Controllers are the brain behind Kuburnetes. They are the process that monitor Kuburnetes as objects and respond accordingly. The most important controller for now is the replication controller. This one helps us run multiple instances of a single pod in the Kuburnetes cluster thus providing high availability. It automatically brings up a new pod if the existing one fails. So it ensures that the specified number of pods keep running at all time. Another reason we need the replication controller is to create multiple paths to share the load across them. The replication controller can spans across multiple nodes in the cluster.
A replication controller is a pod

Difference between Replication Controller and Replica Set
Both have the same purpose but they are not the same. The Replication controller is the older technology that is being replaced by replica set. Replica set is the new recommended way to set up replication. The syntax is a bit different. The apiVersion and the kind are different. And Replica set requires a ‘selector’ underneath the spec section (and underneath selector /matchLabels:/type:). This helps the replica set to identify what pods fall under it. This is because Replica set also can manage pods that were not created as part of the Replica set at creation.

The labels used for the pods and the labels used under the selector should be the same. That is what ties them together.

Kubernetes deployment
Multiple pods are deployed using replication controllers or replica sets. And then comes deployment which is a Kubernetes object that comes higher in the hierarchy. The deployments provides us with the capability to upgrade the underlying instances seamlessly using rolling updates, undo changes and pause and resume changes if required.

To make a deployment, you create a deployment definition file, similar to the replica set definition file, except for the kind which is now going te be ‘deployment’. The template, underneath spec, has a pod definition inside it. Once the file is ready, run de ‘kubectl create’ command and specify the deployment definition file. Then use ‘kubectl get deployments’ to see the newly created deployment. A deployment automatically creates a replica set, which you can see by using the ‘kubectl get replicaset’, and the replica set will create pods, which you can see by using ‘kubectl get pods’.
Example names of the created ‘objects’
Deployment:	myapp-deployment
Replica set:	myapp-depoyment-1234321
Pods: 		myapp-depoyment-1234321-p49vd
		myapp-depoyment-1234321-5kfgs
//this shows that they are build and based on each other.

Rollout and versioning in deployment
When you first create a deployment it triggers a rollout, a new rollout creates a new deployment revision; let’s call it revision 1. In the future when the application is upgraded, meaning when the container version is updated to a new one, a new rollout is triggered and a new deployments revision is created named revision 2. This helpt us keep track of the changes made to our deployment and enables us to roll back to a previous version of deployment (with previous pods). 

NodePort
Instead of NodePort we can use ClusterIP or LoadBalancer.

//gebruik FileZilla om ftps te bewijzen