#/bin/sh

set -ex

mkdir -p $GOPATH/src/github.com/v2ray && cd $GOPATH/src/github.com/v2ray
git clone --recursive https://github.com/v2ray/v2ray-core

cd v2ray-core
go get -v
go get -v -u v2ray.com/core/...
go get -v -u v2ray.com/ext/...
mkdir -p /v2ray
go build -o /v2ray/v2ctl v2ray.com/ext/tools/control/main
go build -o /v2ray/v2ray v2ray.com/core/main
cp ./release/config/geoip.dat /v2ray/
cp ./release/config/geosite.dat /v2ray/
