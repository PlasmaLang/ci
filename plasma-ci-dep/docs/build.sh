#!/bin/sh

set -e

cp ../install.sh .

docker build -t paulbone/plasma-docs-dep:latest .
docker push paulbone/plasma-docs-dep:latest

