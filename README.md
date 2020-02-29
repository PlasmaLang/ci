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

The relevant github documentation is:

 * [Creating a docker action](https://help.github.com/en/actions/building-actions/creating-a-docker-container-action)
 * [Metadata syntax for github actions](https://help.github.com/en/actions/building-actions/metadata-syntax-for-github-actions)

