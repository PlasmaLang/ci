#!/bin/sh

set -e

cp ../install.sh .

docker build -t paulbone/plasma-dep:stable .
docker push paulbone/plasma-dep:stable

