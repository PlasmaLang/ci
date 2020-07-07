FROM debian:buster

##
## The first part of this dockerfile is identical to the Mercury one
## https://github.com/Mercury-Language/packaging/tree/master/docker/min-rotd
## To improve caching
#####################################
RUN apt-get update; apt-get upgrade -yq

WORKDIR /tmp
COPY install.sh .

# Install some mercury dependencies, this creates another docker layer
# allowing some caching.

RUN ./install.sh \
    gcc \
    libhwloc-dev \
    libreadline-dev \
    perl

RUN ./install.sh gnupg
COPY paul.asc .
RUN apt-key add paul.asc
COPY mercury.list /etc/apt/sources.list.d/

# Install a minimal set of Mercury grades
RUN ./install.sh \
    mercury-rotd-llc-dev \
    mercury-rotd-tools=20200531-1

#############################
## End of Mercury dockerfile
##

# Install some Plasma build dependencies.  We will test with both gcc and
# clang so install both.
RUN ./install.sh \
    ctags \
    gcc \
    g++ \
    clang \
    make

