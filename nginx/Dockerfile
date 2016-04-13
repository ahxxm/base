FROM ahxxm/gentoo:latest

# Optimize for cache
COPY init.d.nginx /etc/init.d/nginx
COPY cleanup.sh /cleanup.sh
COPY nginx.sh /nginx.sh

# Nginx build dependencies
RUN emerge --quiet --quiet-build=y sys-libs/zlib sys-devel/binutils dev-libs/pcre++ && \
  /nginx.sh && \
  /cleanup.sh && \
  rm -rf /cleanup.sh /nginx.sh

CMD ["nginx"]

