#!/bin/sh

set -e

cp ../install.sh .

docker build \
    -t paulbone/plasma-ci-dep-stable:latest \
    -t paulbone/plasma-ci-dep-stable:v1 \
    -t paulbone/plasma-ci-dep-stable:v1_0 \
    .
docker push paulbone/plasma-ci-dep-stable:latest
docker push paulbone/plasma-ci-dep-stable:v1
docker push paulbone/plasma-ci-dep-stable:v1_0

