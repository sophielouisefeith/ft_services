# InfluxDB is an open-source time series database (TSDB). It is optimized for fast, 
# high-availability storage and retrieval of time series data. It works with Grafana.

# # building from Alpine Linux
# FROM alpine:3.12
 
# RUN apk update && \
# 	apk add influxdb curl

# # expose default port 8086
# EXPOSE 8086

# #CMD ./startup.sh
# CMD influxd run


FROM alpine:3.12

RUN apk update && \
	apk add influxdb

EXPOSE 8086

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

CMD influxd run -config /etc/influxdb.conf