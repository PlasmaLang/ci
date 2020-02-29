FROM debian:buster

WORKDIR /tmp
COPY install.sh .

# Install some Plasma build dependencies.  We will test with both gcc and
# clang so install both.
RUN ./install.sh \
    asciidoc \
    make \
    source-highlight

