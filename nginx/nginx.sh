#!/bin/sh
set -ex

# ref:
# - https://www.futures.moe/writings/configure-nginx-with-security-and-effective-yes-or-no.htm
NGINX_VERSION=1.15.5
LIBRESSL_VERSION=2.8.2

mkdir -p /tmp

# dependencies
build_dep="curl build-base pcre-dev zlib-dev linux-headers openssl-dev"
run_dep="ca-certificates openssl pcre zlib"

apk --no-cache add ${build_dep} ${run_dep}
adduser -D -s /sbin/nologin www-data

# LibreSSL
cd /tmp
curl -fSL https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${LIBRESSL_VERSION}.tar.gz -o libressl-${LIBRESSL_VERSION}.tar.gz
tar -zxf libressl-${LIBRESSL_VERSION}.tar.gz


# nginx
# check http://nginx.org/en/download.html for the latest version
cd /tmp
curl -fSL https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz -o nginx-${NGINX_VERSION}.tar.gz
tar -zxf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}/
./configure \
    --user=www-data \
    --group=www-data \
    --prefix=/usr/local/nginx \
    --with-http_stub_status_module \
    --with-http_ssl_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_v2_module \
    --with-threads \
    --with-file-aio \
    --with-openssl=/tmp/libressl-${LIBRESSL_VERSION} \
    --with-ld-opt="-lrt"
make -j $(getconf _NPROCESSORS_ONLN)
make install
make clean
rm -rf /tmp /root/.gnupg/
apk del ${build_dep}

# nginx binary add to path
ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx
