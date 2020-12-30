#!/bin/sh

set -e

cp ../install.sh .

docker build \
    -t paulbone/plasma-ci-dep-rotd:v1 \
    -t paulbone/plasma-ci-dep-rotd:v1_1 \
    -t paulbone/plasma-ci-dep-rotd:latest \
    .
docker push paulbone/plasma-ci-dep-rotd:v1
docker push paulbone/plasma-ci-dep-rotd:v1_1
docker push paulbone/plasma-ci-dep-rotd:latest

