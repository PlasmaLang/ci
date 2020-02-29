FROM debian:stretch

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
    ctags \
    gcc \
    g++ \
    clang \
    make

RUN ./install.sh gnupg
ADD https://paul.bone.id.au/paul.asc .
RUN apt-key add paul.asc
COPY mercury.list /etc/apt/sources.list.d/

# Install a minimal set of Mercury grades
RUN ./install.sh \
    mercury-llc-dev \
    mercury-tools=14.01.1-4

