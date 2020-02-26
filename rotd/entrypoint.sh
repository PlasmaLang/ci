#!/bin/sh

echo Build script running.

case "$INPUT_C" in
    gcc)
        CC=gcc
        CXX=g++
        break
        ;;
    clang)
        CC=clang
        CXX=clang++
        break
        ;;
    *)
        echo "Unknown C compiler $INPUT_C"
        exit 1
        ;;
esac

echo C compiler
echo ----------
$CC --version
echo

echo Mercury compiler
echo ----------------
mmc --version
echo MCFLAGS is $MCFLAGS
echo

cat > build.mk << END
JOBS=2
CC=$CC
CXX=$CXX
END

echo build.mk:
cat build.mk
echo

export CI=true
exec make $INPUT_MAKETARGET

