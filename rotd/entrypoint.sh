#!/bin/sh

echo Build script running.

export CI=true
exec make $INPUT_MAKETARGET 

