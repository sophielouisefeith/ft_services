ssh-keygen -A
/usr/sbin/sshd
nginx

# stop container, if one ot he above components stop
while :
do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]
	then
		break
	fi
	ps | grep sshd | grep listener
	if [ $? == 1 ]
	then
		break
	fi
done