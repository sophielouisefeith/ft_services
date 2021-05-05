# building from Alpine Linux
FROM alpine:3.12

# 1
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz && \
	tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz && \
	chmod +x telegraf/telegraf && \
	cp telegraf/telegraf /usr/bin/

# 2.
COPY telegraf.conf /etc/telegraf/telegraf.conf

# 3.
EXPOSE 8125

# 4.
CMD telegraf
