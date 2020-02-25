#!/bin/sh

echo Build script running.

asciidoc --version

export CI=true
exec make $INPUT_MAKETARGET 

