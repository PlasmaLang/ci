CI Scripts for Plasma
=====================

This reposoitory is a small repo with some docker scripts that are used by
github's CI system.

 * [plasma-dep](plasma-dep) contains the Plasma dependencies docker image.
   This is a base image with Mercury and other dependencies that can either
   be used for CI or for people wanting to test Plasma.
   See [docker hub](https://hub.docker.com/r/paulbone/plasma-dep).
 * [rotd](rotd) contains the ROTD version of the CI image, it is based on
   the plasma-dep image.

