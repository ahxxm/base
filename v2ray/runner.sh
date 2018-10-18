#!/bin/sh

set -ex
apt update && apt -y upgrade
apt install -y ca-certificates && update-ca-certificates --fresh --verbose

mkdir /usr/bin/v2ray/
mkdir /etc/v2ray/
mkdir /var/log/v2ray/
touch /etc/v2ray/config.json
