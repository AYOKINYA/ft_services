FROM alpine
ARG IP

RUN apk update

#RUN apk add --no-cache pure-ftpd이 안 되네 ㅋ...
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN apk add --no-cache openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=KR/ST=SEOUL/L=Gangnam/O=42Seoul/CN=ft_services' -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

RUN echo $IP > ip.txt

RUN mkdir -p /home/admin
RUN adduser  --home /home/admin/ -D "admin"
RUN echo "admin:admin" | chpasswd

EXPOSE 20 21 30020 30021
COPY start.sh   ./start.sh
CMD sh ./start.sh
