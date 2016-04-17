#!/bin/sh

set -e

# dep
dep="libev-dev gnutls-dev linux-pam-dev lz4-dev"
build_dep="build-base curl autoconf automake readline-dev libnl3-dev linux-headers gperf"

apk update
apk add $build_dep $dep

# source build
cd
curl -fSL https://github.com/ahxxm/base/raw/master/ocserv/ocserv-0.10.11.zip -o ocserv.zip
unzip -q ocserv.zip
mv ocserv-* ocserv 
cd ocserv

sed -i '/#define DEFAULT_CONFIG_ENTRIES /{s/96/200/}' src/vpn.h
./configure
make
make install


# install
apk del $build_dep
rm /var/cache/apk/*
rm -r /root/*

