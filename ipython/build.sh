#!/bin/sh
apk add --update python py-pip openssl python3 
apk add --update build-base zeromq-dev python-dev python3-dev
ln -s /usr/include/locale.h /usr/include/xlocale.h
pip install --no-cache-dir "ipython[all]"
pip install --no-cache-dir pandas matplotlib

# python3 register?
python3 -m venv 3
source 3/bin/activate
pip install --no-cache-dir ipykernel pandas matplotlib
ipython3 kernel install

apk del build-base zeromq-dev python-dev python3-dev
