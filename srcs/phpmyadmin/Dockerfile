# building from Alpine Linux
FROM alpine:3.12

# 1
RUN apk update && apk upgrade && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session php7-zip && \
	apk add nginx

# 2.
RUN mkdir -p /run/nginx && \
	mkdir -p /www/tmp && \
	mkdir -p /www/phpmyadmin/tmp

# 3
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www/phpmyadmin && \
	rm phpMyAdmin-5.0.1-english.tar.gz

# 4
RUN adduser -D -g 'www' www

# 5
RUN chmod 777 /www/tmp && \
	chmod 777 /www/phpmyadmin/tmp && \
	chown -R www:www /var/lib/nginx && \		
	chown -R www:www /www/tmp && \
	chown -R www:www /www/phpmyadmin/tmp

# 6
COPY nginx.conf etc/nginx/nginx.conf
COPY start.sh /start.sh
COPY config.inc.php /www/config.inc.php
COPY config.inc.php /www/phpmyadmin/config.inc.php

# 7
RUN chmod +x /start.sh

# 8
EXPOSE 5000

# 9
CMD ./start.sh
