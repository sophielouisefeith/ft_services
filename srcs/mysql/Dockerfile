# building from Alpine Linux
FROM alpine:3.12

# 1
RUN	apk update && \
	apk upgrade && \
	apk add mysql \
	mysql-client 

# 2
COPY ./start.sh /start.sh
COPY ./my.cnf /etc/
COPY ./create.sql /create.sql

# 3
RUN chmod +x /start.sh

# 4
EXPOSE 3306

# 5 
CMD ./start.sh
