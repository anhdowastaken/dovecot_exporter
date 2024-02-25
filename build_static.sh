#!/bin/sh

docker run -i -v `pwd`:/dovecot_exporter golang:1.17 /bin/sh << 'EOF'
set -ex

# Install prerequisites for the build process.
apt-get update -q
apt-get install -yq libsystemd-dev

cd /dovecot_exporter

go get -d ./...
go build --ldflags '-extldflags "-static"'
strip dovecot_exporter
EOF
