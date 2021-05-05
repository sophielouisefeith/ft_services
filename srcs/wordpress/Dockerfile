# building from Alpine Linux
FROM alpine:3.12

#1
RUN apk update && \
	apk add nginx mysql-client wget php7 php7-json php7-fpm \
			php7-session php7-mysqli php7-mbstring php7-phar \
			jq curl

# 2 
RUN mkdir /var/run/nginx && \
	mkdir /www

# 3
RUN adduser -D -g 'www' www

# 4
RUN chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# 5
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# 6
WORKDIR	/www
RUN wp core download

# 7
WORKDIR /

# 8
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
COPY wp-config.php	/www/wp-config.php

# 9
RUN chmod +x /start.sh
RUN chmod +x /www/wp-config.php

#10
EXPOSE 5050

# 11
CMD ./start.sh
