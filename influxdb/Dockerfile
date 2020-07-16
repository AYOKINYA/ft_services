FROM alpine

RUN apk update && apk upgrade
RUN apk add influxdb --no-cache 

COPY ./influxdb.conf /etc/

VOLUME ["/var/lib/influxdb"]
EXPOSE 8086

COPY ./start.sh ./start.sh
#RUN sh ./start.sh