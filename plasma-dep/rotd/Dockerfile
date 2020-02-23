FROM debian:buster

WORKDIR /tmp
COPY install.sh .

# Install some mercury dependencies, this creates another docker layer
# allowing some caching.

RUN ./install.sh \
    gcc \
    libhwloc-dev \
    libreadline-dev \
    perl

# Install some Plasma build dependencies.  We will test with both gcc and
# clang so install both.
RUN ./install.sh \
    asciidoc \
    ctags \
    gcc \
    g++ \
    clang \
    git \
    make

RUN ./install.sh gnupg
ADD https://paul.bone.id.au/paul.asc .
RUN apt-key add paul.asc
COPY mercury.list /etc/apt/sources.list.d/

# Install a minimal set of Mercury grades
RUN ./install.sh \
    mercury-rotd-llc-dev \
    mercury-rotd-tools=20200108-1

