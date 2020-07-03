FROM alpine

RUN apk update
RUN apk add --no-cache nginx

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

RUN apk add openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=SEOUL/L=Gangnam/O=42Seoul/CN=ft_services' -keyout /etc/ssl/certs/server.key -out /etc/ssl/certs/server.crt

EXPOSE 80 443
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
