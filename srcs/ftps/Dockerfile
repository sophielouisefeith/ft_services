# FTPS is the same as FTP but it uses SSL to protect the FTP. 
# FTP is used for file exchange between computers. One computer 
# is the FTP server and the other one is the client.

# building from Alpine Linux

FROM alpine:3.12

# updating the packagelist and installing the necessary packages
# creating a folder for the new user for FTP
# creating a new user in the correct map
# creating new key and ssl certificate and putting them in the right directory
# place files inside container
# open ports
# run script to get the right IP address

# 1
RUN apk update && \
	apk add vsftpd && \
	apk add vim && \
	apk add openssl && \
	apk add jq && \
	apk add curl


# 2
RUN mkdir -p ftps/sfeith


# 3
RUN adduser -h /ftps/sfeith -D sfeith
RUN echo "sfeith:halloGoed!1" | chpasswd


# 4
RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=NL/ST=Noord-Holland/O=Codam/CN=localhost.com" -newkey rsa:2048 -keyout \
	/etc/ssl/private/ftps-selfsigned.key -out /etc/ssl/certs/ftps-selfsigned.crt;


# 5
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY getip.sh ./getip.sh			
RUN chmod +x getip.sh

# 6
EXPOSE 20 21 10000 10001 10002


# 7
CMD ./getip.sh
