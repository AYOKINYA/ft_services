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

RUN apk add --no-cache openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=KR/ST=SEOUL/L=Gangnam/O=42Seoul/CN=ft_services' -keyout /etc/ssl/certs/server.key -out /etc/ssl/certs/server.crt

RUN apk add --no-cache openssh
RUN sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa 
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd
# RUN echo "root:root" | chpasswd  root 비번 안 바꾸고 어드민 추가해서 어드민 비번 변경
RUN mkdir -p /var/run/sshd

EXPOSE 80 443 22
COPY setup.sh   ./setup.sh
CMD sh ./setup.sh

