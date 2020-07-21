FROM alpine
ARG IP

RUN apk update && apk upgrade
RUN apk add mysql mysql-client

RUN mkdir -p /run/mysqld
COPY ./mariadb-server.cnf /etc/my.cnf.d/
COPY ./init_sql.sh /tmp/
COPY ./init_docker.sh /tmp/
COPY ./wordpress.sql /tmp/

RUN echo $IP > ip.txt
 
EXPOSE 3306
CMD sh /tmp/init_docker.sh