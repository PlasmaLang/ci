#!/bin/sh

set -e

cp ../install.sh .

docker build -t paulbone/plasma-ci-dep:stable .
docker push paulbone/plasma-ci-dep:stable

