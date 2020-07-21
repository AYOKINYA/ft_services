FROM alpine
ARG IP

RUN apk update && apk upgrade

RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm -f latest.tar.gz
RUN mv wordpress /etc/
COPY wp-config.php /etc/wordpress/wp-config.php

RUN echo $IP > ip.txt

EXPOSE 5050

COPY start.sh   ./start.sh
CMD sh ./start.sh
