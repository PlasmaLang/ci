CI Scripts for Plasma
=====================

This reposoitory is a small repo with some docker scripts that are used by
github's CI system.

 * [plasma-ci-dep](plasma-ci-dep) contains the Plasma dependencies for CI
   docker image.
   This is a base image with Mercury and other dependencies that is
   used for CI.
   See [docker hub](https://hub.docker.com/r/paulbone/plasma-ci-dep).
 * [rotd](rotd) contains the ROTD version of the CI image, it is based on
   the plasma-dep image.

