php-fpm7
nginx

cd www
wp db create

APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null | jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

wp core install --title=Wordpress --admin_user=sfeith --admin_password=halloGoed!1 --admin_email=sfeith@student.codam.nl --skip-email --url=192.168.99.220:5050

wp user create user1 user1@example.com --user_pass=user1 --role=subscriber
wp user create user2 user2@example.com --user_pass=user2 --role=subscriber
wp user create user3 user3@example.com --user_pass=user3 --role=editor

while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php | grep fpm
	if [ $? == 1 ]; then break
	fi
done