# ft_services

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
# Wordpress:	mysql		mysql		wordpress	mysql		utf8
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