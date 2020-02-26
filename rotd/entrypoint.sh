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

BUILD_TYPE=$INPUT_BUILDTYPE
case "$INPUT_BUILDTYPE" in
    dev)
        C_CXX_FLAGS='$(C_CXX_FLAGS_BASE) -O1 -DDEBUG -DPZ_DEV';
        MCFLAGS="-O1";
        break;
        ;;
    rel)
        C_CXX_FLAGS='$(C_CXX_FLAGS_BASE) -O3';
        MCFLAGS="-O4 --intermodule-optimisation";
        break;
        ;;
    *)
        echo "Unknown build type $INPUT_BUILDTYPE";
        exit 1;
        ;;
esac

echo C compiler
echo ----------
$CC --version
echo C_CXX_FLAGS is $C_CXX_FLAGS
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
C_CXX_FLAGS=$C_CXX_FLAGS
MCFLAGS=$MCFLAGS
BUILD_TYPE=$BUILD_TYPE
END

echo build.mk:
cat build.mk
echo

export CI=true
exec make $INPUT_MAKETARGET

