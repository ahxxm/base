#!/bin/sh
apk add --update python py-pip openssl python3 python-dev
apk add --update build-base zeromq-dev
ln -s /usr/include/locale.h /usr/include/xlocale.h
pip install --no-cache-dir "ipython[all]"
pip install --no-cache-dir pandas matplotlib
apk del build-base zeromq-dev