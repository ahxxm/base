#!/bin/sh

# Server cert
# Since client cert requires ca-key, we have to create our own CA..
certtool --generate-privkey --outfile /opt/certs/ca-key.pem \
    && certtool --generate-self-signed --load-privkey /opt/certs/ca-key.pem --template /opt/certs/ca-tmp --outfile /opt/certs/ca-cert.pem \
    && certtool --generate-privkey --outfile /opt/certs/server-key.pem \
    && certtool --generate-certificate --load-privkey /opt/certs/server-key.pem --load-ca-certificate /opt/certs/ca-cert.pem --load-ca-privkey /opt/certs/ca-key.pem --template /opt/certs/serv-tmp --outfile /opt/certs/server-cert.pem

# Client cert
cd /opt/certs && certtool --generate-privkey --outfile user-key.pem \
    && certtool --generate-certificate --load-privkey user-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template user.tmpl --outfile user-cert.pem

# convert to .p12
certtool --to-p12 --load-privkey user-key.pem --pkcs-cipher 3des-pkcs12 --load-certificate user-cert.pem --outfile user.p12 --outder
