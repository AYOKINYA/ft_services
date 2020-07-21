FROM alpine
ARG IP

RUN apk update && apk upgrade
RUN apk add mysql mysql-client

RUN mkdir -p /run/mysqld
COPY ./my.cnf /etc/mysql/
COPY ./mariadb-server.cnf /etc/my.cnf.d/
COPY ./init_sql.sh /tmp/
COPY ./init_docker.sh /tmp/
COPY ./init_wordpress.sh /tmp/
COPY ./wordpress.sql /tmp/

RUN echo $IP > ip.txt

#VOLUME ["/var/lib/mysql"]   
EXPOSE 3306
CMD sh /tmp/init_docker.sh