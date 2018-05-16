#!/bin/sh

set -e
apk update && apk upgrade
apk add ca-certificates && update-ca-certificates tzdata
rm -rf /var/cache/apk/*
mkdir /usr/bin/v2ray/
mkdir /etc/v2ray/
mkdir /var/log/v2ray/
touch /etc/v2ray/config.json
