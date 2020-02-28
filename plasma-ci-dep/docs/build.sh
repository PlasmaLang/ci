#!/bin/sh

set -e

cp ../install.sh .

docker build -t paulbone/plasma-ci-docs-dep:latest .
docker push paulbone/plasma-ci-docs-dep:latest

