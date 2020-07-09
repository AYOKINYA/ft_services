FROM alpine

RUN apk update \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

COPY ./init_docker.sh ./init_docker.sh
COPY ./init_mysql.sh  ./init_mysql.sh
#COPY ./start.sh ./start.sh

RUN chmod 777 init_docker.sh
RUN chmod 777 init_mysql.sh
#RUN chmod 777 start.sh
VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD sh ./init_docker.sh