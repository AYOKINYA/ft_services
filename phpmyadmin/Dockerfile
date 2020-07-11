FROM alpine

RUN apk update && apk upgrade && apk add bash

#install php for mysql and myphpadmin
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
#install phpmyadmin
COPY ./pma_install.sh ./pma_install.sh
RUN sh ./pma_install.sh

COPY config.inc.php /www/config.inc.php

EXPOSE 5000
COPY start.sh   ./start.sh
CMD sh ./start.sh
