FROM alpine
ARG IP

RUN apk update && apk upgrade

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz
RUN tar -xzf telegraf-1.14.0-static_linux_amd64.tar.gz
RUN mv /telegraf /etc/
RUN rm -rf telegraf-1.14.0-static_linux_amd64.tar.gz

RUN echo $IP > ip.txt

COPY ./telegraf.conf /etc/telegraf/

COPY ./start.sh ./start.sh
ENTRYPOINT ["sh", "./start.sh"]