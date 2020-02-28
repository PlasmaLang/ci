#!/bin/sh

set -e

cp ../install.sh .

docker build -t paulbone/plasma-ci-dep:rotd -t paulbone/plasma-ci-dep:latest .
docker push paulbone/plasma-ci-dep:rotd
docker push paulbone/plasma-ci-dep:latest

