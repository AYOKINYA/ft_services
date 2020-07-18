FROM alpine
ARG IP

RUN apk update \
&& apk add mysql mysql-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

RUN mkdir -p /run/mysqld
COPY ./my.cnf /etc/mysql/
COPY ./init_mysql.sh /tmp/
COPY ./init_docker.sh /tmp/
COPY ./wordpress.sql /tmp/

RUN echo $IP > ip.txt

VOLUME ["/var/lib/mysql"]   
EXPOSE 3306
CMD sh /tmp/init_docker.sh