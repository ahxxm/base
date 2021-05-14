#!/bin/sh

set -ex

# build deps
mkdir -p /workdir
cd /workdir
apk add git musl-dev openssl-dev file make
git clone https://github.com/shadowsocks/shadowsocks-rust
cd shadowsocks-rust
git checkout v1.10.9
cargo build --target=x86_64-unknown-linux-musl --features "local-redir trust-dns aead-cipher-extra" --release

# move out for copy stage
cp target/x86_64-unknown-linux-musl/release/ss* /workdir
