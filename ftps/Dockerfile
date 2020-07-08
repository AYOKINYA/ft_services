FROM alpine

ARG PUREFTPD_VERSION=1.0.49

RUN apk update
#RUN apk add --no-cache pure-ftpd
RUN cd /tmp && \
	wget -q https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$PUREFTPD_VERSION.tar.gz	&& \
	tar zxf pure-ftpd-$PUREFTPD_VERSION.tar.gz && \
    ls -al && \
	cd pure-ftpd-$PUREFTPD_VERSION #&& \
	./configure \
    --prefix=/pure-ftpd \
    --without-humor \
    --without-inetd \
    --without-pam \
    --with-altlog \
    --with-cookie \
    --with-ftpwho \
    --with-ldap \
    --with-mysql \
    --with-pgsql \
    --with-puredb \
    --with-quotas \
    --with-ratios \
    --with-throttling \
    --with-tls && \
    make install-strip && \
	cd

RUN apk add --no-cache openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=KR/ST=SEOUL/L=Gangnam/O=42Seoul/CN=ft_services' -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

RUN adduser -D admin
RUN echo "admin:admin" | chpasswd

EXPOSE 21 21000
COPY start.sh   ./start.sh
CMD sh ./start.sh
