# Base Image

[![Circle CI](https://circleci.com/gh/ahxxm/base/tree/master.svg?style=svg)](https://circleci.com/gh/ahxxm/base/tree/master)

for personal use.

## Structure

### nginx

(Latest) nginx with http2 and chacha20.

Config file should be put in `/usr/local/nginx/conf/`.

### shadowsocks-libev

Specify `METHOD` and `PASSWORD` in `environment section` of `docker-compose.yml`.

Default guest port is 8388(both tcp and udp).

### ocserv

This container requires enabling `previliged` option in Docker run:

    docker run -p 21:443 --privileged -d ahxxm/base:ocserv

Configuration file path inside container is `/etc/ocserv/ocserv.conf`:

- Default port in `sample.config` is 443.
- Authentication method is plain account/password.
- No China route.

To add new user:

    docker exec -it [container_id] ocpasswd [username]


## TODO

- [] Improve `sample.config`.
- [] Guide for ocserv certification authorization.
