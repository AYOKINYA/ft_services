FROM alpine

RUN apk update && apk upgrade

RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/grafana/provisioning/dashboards

COPY ./dashboards /var/lib/grafana/dashboards/
COPY ./provisioning/dashboards/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY ./provisioning/datasources/influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/


EXPOSE 3000

COPY ./start.sh ./start.sh
CMD sh ./start.sh