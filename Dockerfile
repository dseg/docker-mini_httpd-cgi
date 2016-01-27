# Dockerfile for mini_httpd

FROM alpine:3.3
MAINTAINER Daichi Shinozaki <dseg@shield.jp>

RUN \
 apk add --update mini_httpd bash curl \
 &&\
 sed \
  -i /etc/mini_httpd/mini_httpd.conf \
  -e 's/^chroot$/#chroot/' \
  -e 's/^#nochroot$/nochroot/' \
 &&\
 rm -rf /var/cache/apk/*

EXPOSE 80

VOLUME /var/www/localhost/htdocs
  
CMD [\
 "mini_httpd", \
 "-C", "/etc/mini_httpd/mini_httpd.conf", \
 "-c", "**.cgi|**.sh", \
 "-l", "/dev/stdout", \
 "-D" \
]
