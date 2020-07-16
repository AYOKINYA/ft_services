FROM alpine

RUN apk update && apk upgrade

RUN apk add grafana telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
#RUN mkdir -p /etc/grafana/provisioning/dashboards

EXPOSE 3000

COPY ./start.sh ./start.sh
CMD sh ./start.sh