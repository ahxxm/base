#!/bin/sh

set -ex

apk update
apk add ca-certificates

mkdir /usr/bin/v2ray/
mkdir /etc/v2ray/
mkdir /var/log/v2ray/
touch /etc/v2ray/config.json
