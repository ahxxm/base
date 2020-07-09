#/bin/sh

set -ex

BAZEL_VER='0.23.0'

apt update
apt install -y unzip

curl -L -o bazel-installer.sh https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VER}/bazel-${BAZEL_VER}-installer-linux-x86_64.sh
chmod +x bazel-installer.sh
./bazel-installer.sh --user

# will download src to /go/src
# fix HEAD
go get -insecure -v -t -d v2ray.com/core/...
cd ./src/v2ray.com/core
git checkout tags/v4.26.0

# update geoip geosite dat
./release/updatedat.sh

# build for linux-amd64
$HOME/bin/bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH --action_env=GPG_PASS=${SIGN_KEY_PASS} --action_env=SPWD=$PWD --action_env=GOCACHE=$(go env GOCACHE) --spawn_strategy local //release:v2ray_linux_amd64_package

# unzip to /v2ray for runner to copy
mkdir -p /v2ray && cd /v2ray
unzip /go/src/v2ray.com/core/bazel-bin/release/v2ray-linux-64.zip
