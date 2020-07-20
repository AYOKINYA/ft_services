FROM alpine

RUN apk update && apk upgrade
RUN apk add influxdb --no-cache 

COPY ./influxdb.conf /etc/

VOLUME ["/var/lib/influxdb"]
EXPOSE 8086

RUN mkdir -p /run/influxd
ENTRYPOINT ["influxd"]