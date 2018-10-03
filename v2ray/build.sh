#/bin/sh

set -ex

mkdir -p $GOPATH/src/github.com/v2ray && cd $GOPATH/src/github.com/v2ray
git clone --recursive https://github.com/v2ray/v2ray-core

cd v2ray-core
go get -v
go get -v -u v2ray.com/core/...
go get -v -u v2ray.com/ext/...
go install v2ray.com/ext/tools/build/vbuild
vbuild -dir /usr/bin/v2ray
