FROM debian:bullseye

##
## The first part of this dockerfile is identical to the Mercury one
## https://github.com/Mercury-Language/packaging/tree/master/docker/min-rel-2201
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

COPY paul.gpg /etc/apt/trusted.gpg.d/paul-6507444DBDF4EAD2.gpg
COPY mercury.list /etc/apt/sources.list.d/

# Install a minimal set of Mercury grades
RUN ./install.sh \
    mercury-llc-dev \
    mercury-tools=22.01-bullseye1

#############################
## End of Mercury dockerfile
##

# Install some Plasma build dependencies.  We will test with both gcc and
# clang so install both.
RUN ./install.sh \
    exuberant-ctags \
    gcc \
    g++ \
    clang \
    make \
    lua5.3 \
    lua-filesystem \
    lua-posix \
    tappy \
    diffutils

ADD https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip /tmp/ninja.zip

RUN ./install.sh unzip; \
    unzip /tmp/ninja.zip; \
    mv /tmp/ninja /usr/local/bin/; \
    apt-get -yq remove unzip

