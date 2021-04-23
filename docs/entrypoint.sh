#!/bin/sh

echo Build script running.

asciidoc --version

JOBS=$(if X=$(nproc 2>&1); then echo $X; else echo 1; fi)

export CI=true
cat > build.mk << END
JOBS=$JOBS
END

export MAKEFLAGS="-j$JOBS"

exec make $INPUT_MAKETARGET 

