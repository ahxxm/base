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

Configuration file path inside container is specified by run command, for example:

    # dangle inside container
    docker run -it --rm -v ~/dev/base/ocserv/conf:/etc/ocserv -v ~/dev/base/ocserv/keys:/opt/certs ahxxm/base:ocserv sh
    ocserv -c /etc/ocserv/sample.config -f -d 999
    -v ~/dev/base/ocserv/keys:/opt/certs

In which:

- ~/dev/base/ocserv/conf: contains `sample.config` and `ocpassword`, there's a default user `ahxxm` with password `ahxxm`, you can delete `ocpassword` and create your own(see below.)
- ~/dev/base/ocserv/keys: contains several files.
- -c: specify config path
- -f: run in foreground
- -d: debug level, from 0 to 9999

About keys/certs:

- server-cert.pem, server-key.pem: just like SSH key/cert pair.
- ca.pem: Certificate Authority.

Configuration file also needs to be modified, here are some default values:

- Default port in `sample.config` is 443.
- Authentication method is plain account/password.
- No China route(yet).

This container requires enabling `previliged` option in Docker run:

    # suppose path of the repo is: ~/dev/base
    docker run -p 21:443 --privileged -d -v ~/dev/base/ocserv/conf:/etc/ocserv -v ~/dev/base/ocserv/keys:/opt/certs ahxxm/base:ocserv ocserv -c /etc/ocserv/sample.config -f

Then to add new user:

    docker exec -it [container_id] ocpasswd [username]


## TODO

- [ ] Improve `sample.config`.
- [ ] Add default key/cert?
- [ ] Guide for ocserv certification authorization.
- [ ] Generate `dh.params` as well?
