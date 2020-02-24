#!/bin/sh

set -e

docker build -t paulbone/plasma-dep:stable .
docker push paulbone/plasma-dep:stable

